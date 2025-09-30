unit SensorForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  WeatherTypes, DatabaseManager;

type
  TfrmSensorForm = class(TForm)
    lblSensorName: TLabel;
    edtSensorName: TEdit;
    lblSensorType: TLabel;
    cbbSensorType: TComboBox;
    lblSensorUnit: TLabel;
    edtSensorUnit: TEdit;
    lblAccuracy: TLabel;
    edtAccuracy: TEdit;
    lblLastCalibration: TLabel;
    dtpLastCalibration: TDateTimePicker;
    cbIsActive: TCheckBox;
    btnOK: TButton;
    btnCancel: TButton;
    
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbbSensorTypeChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    
  private
    FDatabaseManager: TDatabaseManager;
    FEditStation: TWeatherStation;
    FEditSensor: TSensor;
    FIsEditing: Boolean;
    
    procedure LoadSensorTypes;
    procedure LoadSensorData;
    function ValidateInput: Boolean;
    procedure ClearForm;
    function SaveSensor: Boolean;
    
  public
    property DatabaseManager: TDatabaseManager read FDatabaseManager write FDatabaseManager;
    property EditStation: TWeatherStation read FEditStation write FEditStation;
    property EditSensor: TSensor read FEditSensor write FEditSensor;
    property IsEditing: Boolean read FIsEditing write FIsEditing;
  end;

implementation

{$R *.dfm}

uses
  Math, System.UITypes, DateUtils, ValidationService;

procedure TfrmSensorForm.FormCreate(Sender: TObject);
begin
  LoadSensorTypes;
  FIsEditing := False;
  FEditSensor := nil;
  FEditStation := nil;
end;

procedure TfrmSensorForm.FormDestroy(Sender: TObject);
begin
  // Ne pas libérer FEditSensor ou FEditStation
  // Ils appartiennent au formulaire appelant
end;

procedure TfrmSensorForm.FormShow(Sender: TObject);
begin
  if FIsEditing then
  begin
    Caption := 'Modify sensor';
    if Assigned(FEditSensor) then
      LoadSensorData
    else
    begin
      MessageDlg('No sensor assigned for editing.', mtError, [mbOK], 0);
      ModalResult := mrCancel;
      Exit;
    end;
  end
  else
  begin
    Caption := 'Add New Sensor to Station';
    ClearForm;
  end;

  if edtSensorName.CanFocus then 
    edtSensorName.SetFocus;
end;

procedure TfrmSensorForm.LoadSensorTypes;
var
  SensorType: TSensorType;
begin
  cbbSensorType.Items.Clear;
  for SensorType := Low(TSensorType) to High(TSensorType) do
    cbbSensorType.Items.Add(SensorType.ToString);
end;

procedure TfrmSensorForm.LoadSensorData;
begin
  if not Assigned(FEditSensor) then
    Exit;
    
  edtSensorName.Text := FEditSensor.Name;
  cbbSensorType.ItemIndex := Ord(FEditSensor.SensorType);
  edtSensorUnit.Text := FEditSensor.&Unit;
  
  if (FEditSensor.LastCalibration > 0) and 
     (FEditSensor.LastCalibration < EncodeDate(2100, 1, 1)) then
    dtpLastCalibration.DateTime := FEditSensor.LastCalibration
  else
    dtpLastCalibration.DateTime := Now;
    
  edtAccuracy.Text := FloatToStr(FEditSensor.Accuracy);
  cbIsActive.Checked := FEditSensor.IsActive;
  
  cbbSensorTypeChange(nil);
end;

procedure TfrmSensorForm.ClearForm;
begin
  edtSensorName.Text := '';
  cbbSensorType.ItemIndex := -1;
  edtSensorUnit.Text := '';
  edtAccuracy.Text := '0.1';
  dtpLastCalibration.DateTime := Now;
  cbIsActive.Checked := True;
end;

procedure TfrmSensorForm.cbbSensorTypeChange(Sender: TObject);
var
  SensorType: TSensorType;
begin
  if cbbSensorType.ItemIndex >= 0 then
  begin
    SensorType := TSensorType(cbbSensorType.ItemIndex);
    edtSensorUnit.Text := SensorType.GetDefaultUnit;
  end;
end;

function TfrmSensorForm.ValidateInput: Boolean;
var
  Accuracy: Double;
  Error: string;
begin
  Result := False;
  
  // Validate name using ValidationService
  if not TValidationService.ValidateRequiredString(edtSensorName.Text, 'Sensor name', Error) then
  begin
    MessageDlg(Error, mtError, [mbOK], 0);
    if edtSensorName.CanFocus then
      edtSensorName.SetFocus;
    Exit;
  end;

  if cbbSensorType.ItemIndex < 0 then
  begin
    MessageDlg('Sensor type is required.', mtError, [mbOK], 0);
    if cbbSensorType.CanFocus then
      cbbSensorType.SetFocus;
    Exit;
  end;

  if not TValidationService.ValidateRequiredString(edtSensorUnit.Text, 'Measurement unit', Error) then
  begin
    MessageDlg(Error, mtError, [mbOK], 0);
    if edtSensorUnit.CanFocus then
      edtSensorUnit.SetFocus;
    Exit;
  end;
  
  if Trim(edtAccuracy.Text) <> '' then
  begin
    if not TryStrToFloat(edtAccuracy.Text, Accuracy) then
    begin
      MessageDlg('Accuracy must be a valid number.', mtError, [mbOK], 0);
      if edtAccuracy.CanFocus then
        edtAccuracy.SetFocus;
      Exit;
    end;
    
    if Accuracy <= 0 then
    begin
      MessageDlg('Accuracy must be greater than zero.', mtError, [mbOK], 0);
      if edtAccuracy.CanFocus then
        edtAccuracy.SetFocus;
      Exit;
    end;
  end;
  
  // Validate date
  if not TValidationService.ValidatePastDate(dtpLastCalibration.DateTime,
                                            'Last calibration date', Error) then
  begin
    MessageDlg(Error, mtError, [mbOK], 0);
    if dtpLastCalibration.CanFocus then
      dtpLastCalibration.SetFocus;
    Exit;
  end;
  
  Result := True;
end;

procedure TfrmSensorForm.btnOKClick(Sender: TObject);
begin
  if not ValidateInput then
    Exit;
    
  if SaveSensor then
    ModalResult := mrOk;
end;

function TfrmSensorForm.SaveSensor: Boolean;
var
  Accuracy: Double;
  SensorID: string;
begin
  Result := False;

  try
    if FIsEditing and Assigned(FEditSensor) then
    begin
      // Mode édition : modifier le capteur existant
      FEditSensor.Name := Trim(edtSensorName.Text);
      FEditSensor.SensorType := TSensorType(cbbSensorType.ItemIndex);
      FEditSensor.&Unit := Trim(edtSensorUnit.Text);
      FEditSensor.IsActive := cbIsActive.Checked;
      FEditSensor.LastCalibration := dtpLastCalibration.DateTime;

      if TryStrToFloat(edtAccuracy.Text, Accuracy) then
        FEditSensor.Accuracy := Accuracy
      else
        FEditSensor.Accuracy := 0.1;
        
      Result := True;
    end
    else
    begin
      // Mode ajout : créer un nouveau capteur
      if not Assigned(FEditStation) then
      begin
        MessageDlg('No station assigned.', mtError, [mbOK], 0);
        Exit;
      end;

      SensorID := GenerateGUID;

      if TryStrToFloat(edtAccuracy.Text, Accuracy) then
      begin
        if Accuracy <= 0 then
          Accuracy := 0.1;
      end
      else
        Accuracy := 0.1;

      FEditSensor := TSensor.Create(
        SensorID,
        Trim(edtSensorName.Text),
        Trim(edtSensorUnit.Text),
        GenerateGUID, // SerialNumber
        TSensorType(cbbSensorType.ItemIndex),
        cbIsActive.Checked,
        dtpLastCalibration.DateTime,
        Accuracy
      );

      // Ajouter à la station
      FEditStation.Sensors.Add(FEditSensor);
      Result := True;
    end;

  except
    on E: Exception do
    begin
      MessageDlg('Error saving sensor: ' + E.Message, mtError, [mbOK], 0);
      Result := False;
    end;
  end;
end;

end.