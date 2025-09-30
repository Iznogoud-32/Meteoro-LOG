object frmSensorForm: TfrmSensorForm
  Left = 0
  Top = 0
  Caption = 'Sensor'
  ClientHeight = 320
  ClientWidth = 450
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object lblSensorName: TLabel
    Left = 24
    Top = 24
    Width = 27
    Height = 15
    Caption = 'Nom'
  end
  object lblSensorType: TLabel
    Left = 24
    Top = 80
    Width = 63
    Height = 15
    Caption = 'Sensor Type'
  end
  object lblSensorUnit: TLabel
    Left = 24
    Top = 136
    Width = 22
    Height = 15
    Caption = 'Unit'
  end
  object lblAccuracy: TLabel
    Left = 240
    Top = 136
    Width = 49
    Height = 15
    Caption = 'Accuracy'
  end
  object lblLastCalibration: TLabel
    Left = 24
    Top = 192
    Width = 80
    Height = 15
    Caption = 'Last calibration'
  end
  object edtSensorName: TEdit
    Left = 24
    Top = 40
    Width = 400
    Height = 23
    TabOrder = 0
  end
  object cbbSensorType: TComboBox
    Left = 24
    Top = 96
    Width = 400
    Height = 23
    Style = csDropDownList
    TabOrder = 1
    OnChange = cbbSensorTypeChange
  end
  object edtSensorUnit: TEdit
    Left = 24
    Top = 152
    Width = 200
    Height = 23
    TabOrder = 2
  end
  object edtAccuracy: TEdit
    Left = 240
    Top = 152
    Width = 184
    Height = 23
    TabOrder = 3
  end
  object dtpLastCalibration: TDateTimePicker
    Left = 24
    Top = 208
    Width = 200
    Height = 23
    Date = 45261.000000000000000000
    Time = 0.500000000000000000
    TabOrder = 4
  end
  object cbIsActive: TCheckBox
    Left = 24
    Top = 248
    Width = 97
    Height = 17
    Caption = 'Active Sensor'
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object btnOK: TButton
    Left = 264
    Top = 280
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 6
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 349
    Top = 280
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 7
  end
end
