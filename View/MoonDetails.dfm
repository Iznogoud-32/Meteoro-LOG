object MoonForm: TMoonForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Le petit rapporteur m'#233't'#233'o - Le cycle de la lune'
  ClientHeight = 300
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 13
  object lbl_local: TLabel
    Left = 24
    Top = 16
    Width = 62
    Height = 13
    Caption = 'Date Locale:'
  end
  object val_local: TLabel
    Left = 120
    Top = 16
    Width = 5
    Height = 13
    Caption = 'x'
  end
  object lbl_age: TLabel
    Left = 24
    Top = 40
    Width = 77
    Height = 13
    Caption = 'Age de la lune:'
  end
  object val_age: TLabel
    Left = 120
    Top = 40
    Width = 5
    Height = 13
    Caption = 'x'
  end
  object lbl_phase: TLabel
    Left = 24
    Top = 64
    Width = 87
    Height = 13
    Caption = 'Phase de la lune:'
  end
  object val_phase: TLabel
    Left = 120
    Top = 64
    Width = 5
    Height = 13
    Caption = 'x'
  end
  object val_moon_phase: TLabel
    Left = 169
    Top = 64
    Width = 5
    Height = 13
    Caption = 'x'
  end
  object BtnFermer: TButton
    Left = 175
    Top = 257
    Width = 75
    Height = 25
    Caption = 'Fermer'
    ModalResult = 1
    TabOrder = 0
  end
  object GroupBoxCycle: TGroupBox
    Left = 48
    Top = 88
    Width = 321
    Height = 153
    Caption = 'Infos sur le cycle lunaire en cours'
    TabOrder = 1
    object lbl_lastnew: TLabel
      Left = 24
      Top = 28
      Width = 120
      Height = 13
      Caption = 'Derni'#232're nouvelle lune:'
    end
    object val_newmoon: TLabel
      Left = 151
      Top = 28
      Width = 5
      Height = 13
      Caption = 'x'
    end
    object lbl_firstquart: TLabel
      Left = 24
      Top = 52
      Width = 85
      Height = 13
      Caption = 'Premier quartier:'
    end
    object lbl_full: TLabel
      Left = 24
      Top = 76
      Width = 60
      Height = 13
      Caption = 'Pleine lune:'
    end
    object lbl_lastquart: TLabel
      Left = 24
      Top = 100
      Width = 85
      Height = 13
      Caption = 'Dernier quartier:'
    end
    object lbl_nextnew: TLabel
      Left = 24
      Top = 124
      Width = 127
      Height = 13
      Caption = 'Prochaine nouvelle lune:'
    end
    object val_firstquart: TLabel
      Left = 151
      Top = 52
      Width = 5
      Height = 13
      Caption = 'x'
    end
    object val_full: TLabel
      Left = 151
      Top = 76
      Width = 5
      Height = 13
      Caption = 'x'
    end
    object val_lastquart: TLabel
      Left = 151
      Top = 100
      Width = 5
      Height = 13
      Caption = 'x'
    end
    object val_nextnew: TLabel
      Left = 151
      Top = 124
      Width = 5
      Height = 13
      Caption = 'x'
    end
  end
end
