unit StationForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.ExtDlgs, Vcl.CheckLst,
  WeatherTypes, DatabaseManager, StationService, System.Actions, Vcl.ActnList, 
  SensorForm, AdvListV;

type
  TfrmStationForm = class(TForm)
    pnlButtons: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    OpenPictureDialog: TOpenPictureDialog;
    ActionList: TActionList;
    actAddSensor: TAction;
    actEditSensor: TAction;
    actDeleteSensor: TAction;
    pnlHeader: TPanel;
    lblFormTitle: TLabel;
    lblFormDescription: TLabel;
    pnlContent: TPanel;
    pcStation: TPageControl;
    tsGeneral: TTabSheet;
    gbBasicInfo: TGroupBox;
    lblName: TLabel;
    lblAddress: TLabel;
    lblType: TLabel;
    lblStatus: TLabel;
    lblDescription: TLabel;
    edtName: TEdit;
    edtAddress: TEdit;
    cbbType: TComboBox;
    cbbStatus: TComboBox;
    memoDescription: TMemo;
    gbLocalisation: TGroupBox;
    lblLatitude: TLabel;
    lblLongitude: TLabel;
    lblAltitude: TLabel;
    edtLatitude: TEdit;
    edtLongitude: TEdit;
    edtAltitude: TEdit;
    gbDates: TGroupBox;
    lblInstallationDate: TLabel;
    lblLastMaintenance: TLabel;
    lblNextMaintenance: TLabel;
    dtpInstallationDate: TDateTimePicker;
    dtpLastMaintenance: TDateTimePicker;
    cbLastMaintenanceEnabled: TCheckBox;
    dtpNextMaintenance: TDateTimePicker;
    cbNextMaintenanceEnabled: TCheckBox;
    gbPicture: TGroupBox;
    lblPhotoPath: TLabel;
    imgPhoto: TImage;
    btnSelectPhoto: TButton;
    btnRemovePhoto: TButton;
    tsSensors: TTabSheet;
    gbSensors: TGroupBox;
    pnlSensorButtons: TPanel;
    btnAddSensor: TButton;
    btnEditSensor: TButton;
    btnDeleteSensor: TButton;
    AdvLvSensorsList: TAdvListView;
    
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnSelectPhotoClick(Sender: TObject);
    procedure btnRemovePhotoClick(Sender: TObject);
    procedure cbLastMaintenanceEnabledClick(Sender: TObject);
    procedure cbNextMaintenanceEnabledClick(Sender: TObject);
    procedure actAddSensorExecute(Sender: TObject);
    procedure actEditSensorExecute(Sender: TObject);
    procedure actDeleteSensorExecute(Sender: TObject);
    procedure lvSensorsSelectItem(Sender: TObject; Item: TListItem; Selected: Boolean);
    procedure lvSensorsDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    FDatabaseManager: TDatabaseManager;
    FStationService: TStationService;
    FEditStation: TWeatherStation;
    FTempStation: TWeatherStation;
    FIsEditing: Boolean;
    
    procedure InitializeControls;
    procedure LoadStationTypes;
    procedure LoadStationStatuses;
    procedure LoadStationData;
    procedure DisplaySensors;
    procedure UpdateSensorActions;
    function ValidateInput: Boolean;
    function SaveStation: Boolean;
    procedure ClearForm;
    function GetWorkingStation: TWeatherStation;
    
  public
    property DatabaseManager: TDatabaseManager read FDatabaseManager write FDatabaseManager;
    property StationService: TStationService read FStationService write FStationService;
    property EditStation: TWeatherStation read FEditStation write FEditStation;
    property IsEditing: Boolean read FIsEditing write FIsEditing;
  end;

implementation

{$R *.dfm}

uses
  Math, System.UITypes, DateUtils, ValidationService;

{ TfrmStationForm }

procedure TfrmStationForm.FormCreate(Sender: TObject);
begin
  InitializeControls;
  LoadStationTypes;
  LoadStationStatuses;
  FIsEditing := False;
  FTempStation := nil;
  FEditStation := nil;
  FStationService := nil;
end;

procedure TfrmStationForm.FormDestroy(Sender: TObject);
begin
  if not FIsEditing then //and Assigned(FTempStation) then
    FTempStation.Free;
end;

procedure TfrmStationForm.FormShow(Sender: TObject);
begin
  if FIsEditing then
  begin
    if not Assigned(FEditStation) then
    begin
      MessageDlg('No station assigned for editing.', mtError, [mbOK], 0);
      ModalResult := mrCancel;
      Exit;
    end;

    Caption := 'Modify Weather Station - ' + FEditStation.Name;
    lblFormTitle.Caption := 'Edit Station';
    lblFormDescription.Caption := 'Modify station information';
    LoadStationData;
  end
  else
  begin
    Caption := 'Add New Weather Station';
    lblFormTitle.Caption := 'New Station';
    lblFormDescription.Caption := 'Create a new weather station';

    FTempStation := TWeatherStation.Create(
      GenerateGUID,
      '',
      '',
      '',
      '',
      TCoordinates.Create(0, 0),
      stAutomatic,
      ssActive,
      Now,
      0,
      0,
      0
    );

    ClearForm;
  end;

  UpdateSensorActions;
end;

function TfrmStationForm.GetWorkingStation: TWeatherStation;
begin
  if FIsEditing then
    Result := FEditStation
  else
    Result := FTempStation;
end;

procedure TfrmStationForm.InitializeControls;
begin
  Position := poScreenCenter;
  WindowState := wsNormal;
  
  pcStation.ActivePageIndex := 0;
  
  with AdvLvSensorsList do
  begin
    if Columns.Count >= 6 then
    begin
      Columns[0].Width := 150;
      Columns[1].Width := 120;
      Columns[2].Width := 60;
      Columns[3].Width := 50;
      Columns[4].Width := 70;
      Columns[5].Width := 120;
    end;
  end;

  dtpInstallationDate.DateTime := Now;
  dtpLastMaintenance.DateTime := Now;
  dtpNextMaintenance.DateTime := Now + 180;
  
  cbLastMaintenanceEnabled.Checked := False;
  cbNextMaintenanceEnabled.Checked := False;
  cbLastMaintenanceEnabledClick(nil);
  cbNextMaintenanceEnabledClick(nil);
  
  imgPhoto.Stretch := True;
  imgPhoto.Proportional := True;
  imgPhoto.Center := True;
end;

procedure TfrmStationForm.LoadStationTypes;
var
  StationType: TStationType;
begin
  cbbType.Items.Clear;
  for StationType := Low(TStationType) to High(TStationType) do
    cbbType.Items.Add(StationType.ToString);
  cbbType.ItemIndex := -1;
end;

procedure TfrmStationForm.LoadStationStatuses;
var
  Status: TStationStatus;
begin
  cbbStatus.Items.Clear;
  for Status := Low(TStationStatus) to High(TStationStatus) do
    cbbStatus.Items.Add(Status.ToString);
  cbbStatus.ItemIndex := -1;
end;

procedure TfrmStationForm.LoadStationData;
begin
  if not Assigned(FEditStation) then
    Exit;

  edtName.Text := FEditStation.Name;
  edtAddress.Text := FEditStation.Address;
  memoDescription.Text := FEditStation.Description;

  edtLatitude.Text := FloatToStr(FEditStation.Coordinates.Latitude);
  edtLongitude.Text := FloatToStr(FEditStation.Coordinates.Longitude);
  edtAltitude.Text := IntToStr(FEditStation.Altitude);

  cbbType.ItemIndex := Ord(FEditStation.StationType);
  cbbStatus.ItemIndex := Ord(FEditStation.Status);

  if (FEditStation.InstallationDate > 0) and 
     (FEditStation.InstallationDate < EncodeDate(2100, 1, 1)) then
    dtpInstallationDate.DateTime := FEditStation.InstallationDate;

  cbLastMaintenanceEnabled.Checked := FEditStation.LastMaintenance > 0;
  if (FEditStation.LastMaintenance > 0) and 
     (FEditStation.LastMaintenance < EncodeDate(2100, 1, 1)) then
    dtpLastMaintenance.DateTime := FEditStation.LastMaintenance;

  cbNextMaintenanceEnabled.Checked := FEditStation.NextMaintenance > 0;
  if (FEditStation.NextMaintenance > 0) and 
     (FEditStation.NextMaintenance < EncodeDate(2100, 1, 1)) then
    dtpNextMaintenance.DateTime := FEditStation.NextMaintenance;

  if (FEditStation.Photo <> '') and FileExists(FEditStation.Photo) then
  begin
    try
      imgPhoto.Picture.LoadFromFile(FEditStation.Photo);
      lblPhotoPath.Caption := ExtractFileName(FEditStation.Photo);
      lblPhotoPath.Hint := FEditStation.Photo;
    except
      lblPhotoPath.Caption := 'Error while loading';
    end;
  end;

  DisplaySensors;
end;

procedure TfrmStationForm.DisplaySensors;
var
  Sensor: TSensor;
  Item: TListItem;
  AccuracyText, CalibrationText: string;
  WorkingStation: TWeatherStation;
begin
  AdvLvSensorsList.Items.Clear;

  WorkingStation := GetWorkingStation;
  if not Assigned(WorkingStation) or not Assigned(WorkingStation.Sensors) then
    Exit;

  for Sensor in WorkingStation.Sensors do
  begin
    Item := AdvLvSensorsList.Items.Add;
    Item.Caption := Sensor.Name;
    Item.SubItems.Add(Sensor.SensorType.ToString);
    Item.SubItems.Add(Sensor.&Unit);

    if Sensor.IsActive then
    begin
      Item.SubItems.Add('Yes');
      Item.ImageIndex := 0;
    end
    else
    begin
      Item.SubItems.Add('No');
      Item.ImageIndex := 1;
    end;

    if Sensor.Accuracy > 0 then
      AccuracyText := Format('±%.2f', [Sensor.Accuracy])
    else
      AccuracyText := '';
    Item.SubItems.Add(AccuracyText);

    if (Sensor.LastCalibration > 0) and 
       (Sensor.LastCalibration < EncodeDate(2100, 1, 1)) then
      CalibrationText := DateToStr(Sensor.LastCalibration)
    else
      CalibrationText := '';
    Item.SubItems.Add(CalibrationText);

    Item.Data := Sensor;
  end;
end;

procedure TfrmStationForm.UpdateSensorActions;
var
  HasSelection: Boolean;
begin
  HasSelection := AdvLvSensorsList.Selected <> nil;
  actEditSensor.Enabled := HasSelection;
  actDeleteSensor.Enabled := HasSelection;
end;

function TfrmStationForm.ValidateInput: Boolean;
var
  Lat, Lng: Double;
  Alt: Integer;
  Error: string;
begin
  Result := False;
  
  // Use ValidationService
  if not TValidationService.ValidateRequiredString(edtName.Text, 'Station name', Error) then
  begin
    MessageDlg(Error, mtError, [mbOK], 0);
    if edtName.CanFocus then edtName.SetFocus;
    Exit;
  end;

  if not TryStrToFloat(edtLatitude.Text, Lat) then
  begin
    MessageDlg('Latitude must be a valid number.', mtError, [mbOK], 0);
    if edtLatitude.CanFocus then edtLatitude.SetFocus;
    Exit;
  end;

  if not TValidationService.ValidateLatitude(Lat, Error) then
  begin
    MessageDlg(Error, mtError, [mbOK], 0);
    if edtLatitude.CanFocus then edtLatitude.SetFocus;
    Exit;
  end;

  if not TryStrToFloat(edtLongitude.Text, Lng) then
  begin
    MessageDlg('Longitude must be a valid number.', mtError, [mbOK], 0);
    if edtLongitude.CanFocus then edtLongitude.SetFocus;
    Exit;
  end;

  if not TValidationService.ValidateLongitude(Lng, Error) then
  begin
    MessageDlg(Error, mtError, [mbOK], 0);
    if edtLongitude.CanFocus then edtLongitude.SetFocus;
    Exit;
  end;

  if TryStrToInt(edtAltitude.Text, Alt) then
  begin
    if not TValidationService.ValidateAltitude(Alt, Error) then
    begin
      MessageDlg(Error, mtError, [mbOK], 0);
      if edtAltitude.CanFocus then edtAltitude.SetFocus;
      Exit;
    end;
  end;

  if cbbType.ItemIndex < 0 then
  begin
    MessageDlg('Station type is required.', mtError, [mbOK], 0);
    if cbbType.CanFocus then cbbType.SetFocus;
    Exit;
  end;

  if cbbStatus.ItemIndex < 0 then
  begin
    MessageDlg('Station status is required.', mtError, [mbOK], 0);
    if cbbStatus.CanFocus then cbbStatus.SetFocus;
    Exit;
  end;

  Result := True;
end;

function TfrmStationForm.SaveStation: Boolean;
var
  Station: TWeatherStation;
  Lat, Lng: Double;
  Alt: Integer;
begin
  Result := False;

  if not ValidateInput then
    Exit;

  try
    Station := GetWorkingStation;

    if not Assigned(Station) then
    begin
      MessageDlg('Internal error: No working station.', mtError, [mbOK], 0);
      Exit;
    end;

    Station.Name := Trim(edtName.Text);
    Station.Address := Trim(edtAddress.Text);
    Station.Description := Trim(memoDescription.Text);

    Lat := StrToFloat(edtLatitude.Text);
    Lng := StrToFloat(edtLongitude.Text);
    Station.Coordinates := TCoordinates.Create(Lat, Lng);

    if TryStrToInt(edtAltitude.Text, Alt) then
      Station.Altitude := Alt
    else
      Station.Altitude := 0;

    Station.StationType := TStationType(cbbType.ItemIndex);
    Station.Status := TStationStatus(cbbStatus.ItemIndex);
    Station.InstallationDate := dtpInstallationDate.DateTime;

    if cbLastMaintenanceEnabled.Checked then
      Station.LastMaintenance := dtpLastMaintenance.DateTime
    else
      Station.LastMaintenance := 0;

    if cbNextMaintenanceEnabled.Checked then
      Station.NextMaintenance := dtpNextMaintenance.DateTime
    else
      Station.NextMaintenance := 0;

    Station.Photo := lblPhotoPath.Hint;

    // Use service for business logic validation and save
    if Assigned(FStationService) then
    begin
      if FIsEditing then
        Result := FStationService.UpdateStation(Station)
      else
      begin
        Result := True; //FStationService.CreateStation(Station);
        if Result then
          FTempStation := nil; // Transfer ownership
      end;
    end
    else
    begin
      // Fallback to direct database access
      if FIsEditing then
        Result := FDatabaseManager.UpdateStation(Station)
      else
      begin
        Result := True; //FDatabaseManager.AddStation(Station);
        if Result then
          FTempStation := nil;
      end;
    end;

    if not Result then
      MessageDlg('Error while saving station.', mtError, [mbOK], 0);

  except
    on E: Exception do
    begin
      MessageDlg('Error: ' + E.Message, mtError, [mbOK], 0);
      Result := False;
    end;
  end;
end;

procedure TfrmStationForm.ClearForm;
begin
  edtName.Text := '';
  edtAddress.Text := '';
  memoDescription.Text := '';
  edtLatitude.Text := '0';
  edtLongitude.Text := '0';
  edtAltitude.Text := '0';

  cbbType.ItemIndex := 0;
  cbbStatus.ItemIndex := 0;

  dtpInstallationDate.DateTime := Now;
  dtpLastMaintenance.DateTime := Now;
  dtpNextMaintenance.DateTime := Now + 180;

  cbLastMaintenanceEnabled.Checked := False;
  cbNextMaintenanceEnabled.Checked := False;
  cbLastMaintenanceEnabledClick(nil);
  cbNextMaintenanceEnabledClick(nil);

  imgPhoto.Picture := nil;
  lblPhotoPath.Caption := 'No Picture Selected';
  lblPhotoPath.Hint := '';

  DisplaySensors;
end;

procedure TfrmStationForm.btnOKClick(Sender: TObject);
begin
  if SaveStation then
    ModalResult := mrOk;
end;

procedure TfrmStationForm.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmStationForm.btnSelectPhotoClick(Sender: TObject);
begin
  if OpenPictureDialog.Execute then
  begin
    try
      imgPhoto.Picture.LoadFromFile(OpenPictureDialog.FileName);
      lblPhotoPath.Caption := ExtractFileName(OpenPictureDialog.FileName);
      lblPhotoPath.Hint := OpenPictureDialog.FileName;
    except
      MessageDlg('Error while loading picture.', mtError, [mbOK], 0);
    end;
  end;
end;

procedure TfrmStationForm.btnRemovePhotoClick(Sender: TObject);
begin
  imgPhoto.Picture := nil;
  lblPhotoPath.Caption := 'No Picture Selected';
  lblPhotoPath.Hint := '';
end;

procedure TfrmStationForm.cbLastMaintenanceEnabledClick(Sender: TObject);
begin
  dtpLastMaintenance.Enabled := cbLastMaintenanceEnabled.Checked;
end;

procedure TfrmStationForm.cbNextMaintenanceEnabledClick(Sender: TObject);
begin
  dtpNextMaintenance.Enabled := cbNextMaintenanceEnabled.Checked;
end;

procedure TfrmStationForm.actAddSensorExecute(Sender: TObject);
var
  SensorForm: TfrmSensorForm;
  WorkingStation: TWeatherStation;
begin
  WorkingStation := GetWorkingStation;
  if not Assigned(WorkingStation) then
    Exit;

  SensorForm := TfrmSensorForm.Create(Self);
  try
    SensorForm.DatabaseManager := FDatabaseManager;
    SensorForm.EditStation := WorkingStation;
    SensorForm.IsEditing := False;

    if SensorForm.ShowModal = mrOk then
    begin
      DisplaySensors;
      UpdateSensorActions;
    end;
  finally
    SensorForm.Free;
  end;
end;

procedure TfrmStationForm.actEditSensorExecute(Sender: TObject);
var
  SensorForm: TfrmSensorForm;
  SelectedSensor: TSensor;
  WorkingStation: TWeatherStation;
begin
  if AdvLvSensorsList.Selected = nil then
    Exit;

  WorkingStation := GetWorkingStation;
  if not Assigned(WorkingStation) then
    Exit;

  SelectedSensor := TSensor(AdvLvSensorsList.Selected.Data);
  if not Assigned(SelectedSensor) then
    Exit;

  SensorForm := TfrmSensorForm.Create(Self);
  try
    SensorForm.DatabaseManager := FDatabaseManager;
    SensorForm.EditStation := WorkingStation;
    SensorForm.EditSensor := SelectedSensor;
    SensorForm.IsEditing := True;

    if SensorForm.ShowModal = mrOk then
    begin
      DisplaySensors;
      UpdateSensorActions;
    end;
  finally
    SensorForm.Free;
  end;
end;

procedure TfrmStationForm.actDeleteSensorExecute(Sender: TObject);
var
  SelectedSensor: TSensor;
  WorkingStation: TWeatherStation;
begin
  if AdvLvSensorsList.Selected = nil then
    Exit;

  WorkingStation := GetWorkingStation;
  if not Assigned(WorkingStation) then
    Exit;

  SelectedSensor := TSensor(AdvLvSensorsList.Selected.Data);
  if not Assigned(SelectedSensor) then
    Exit;

  if MessageDlg('Are you sure about deleting this sensor?', 
                mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    WorkingStation.Sensors.Remove(SelectedSensor);
    DisplaySensors;
    UpdateSensorActions;
  end;
end;

procedure TfrmStationForm.lvSensorsSelectItem(Sender: TObject; Item: TListItem; 
  Selected: Boolean);
begin
  UpdateSensorActions;
end;

procedure TfrmStationForm.lvSensorsDblClick(Sender: TObject);
begin
  if actEditSensor.Enabled then
    actEditSensor.Execute;
end;

end.