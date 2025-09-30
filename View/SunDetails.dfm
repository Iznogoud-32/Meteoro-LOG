object SunForm: TSunForm
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Le petit rapporteur m'#233't'#233'o - Informations solaires'
  ClientHeight = 376
  ClientWidth = 420
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 13
  object lbl_local: TLabel
    Left = 24
    Top = 16
    Width = 60
    Height = 13
    Caption = 'Date Locale:'
  end
  object val_local: TLabel
    Left = 120
    Top = 16
    Width = 6
    Height = 13
    Caption = 'x'
  end
  object GroupBoxSoleil: TGroupBox
    Left = 49
    Top = 42
    Width = 321
    Height = 275
    Caption = 'Horaires de lever et de coucher'
    TabOrder = 0
    object Lbl_AReel: TLabel
      Left = 24
      Top = 28
      Width = 64
      Height = 13
      Caption = 'Aube R'#233'elle :'
    end
    object Val_AReel: TLabel
      Left = 164
      Top = 28
      Width = 6
      Height = 13
      Caption = 'x'
    end
    object Lbl_CReel: TLabel
      Left = 24
      Top = 52
      Width = 84
      Height = 13
      Caption = 'Cr'#233'puscule R'#233'el :'
    end
    object Val_CReel: TLabel
      Left = 164
      Top = 52
      Width = 6
      Height = 13
      Caption = 'x'
    end
    object Val_CCivil: TLabel
      Left = 164
      Top = 114
      Width = 6
      Height = 13
      Caption = 'x'
    end
    object Lbl_ACivil: TLabel
      Left = 24
      Top = 90
      Width = 60
      Height = 13
      Caption = 'Aube Civile :'
    end
    object Val_ACivil: TLabel
      Left = 164
      Top = 90
      Width = 6
      Height = 13
      Caption = 'x'
    end
    object Lbl_CCivil: TLabel
      Left = 24
      Top = 114
      Width = 82
      Height = 13
      Caption = 'Cr'#233'puscule Civil :'
    end
    object Val_CNautique: TLabel
      Left = 164
      Top = 181
      Width = 6
      Height = 13
      Caption = 'x'
    end
    object Lbl_ANautique: TLabel
      Left = 24
      Top = 157
      Width = 78
      Height = 13
      Caption = 'Aube Nautique :'
    end
    object Val_ANautique: TLabel
      Left = 164
      Top = 157
      Width = 6
      Height = 13
      Caption = 'x'
    end
    object Lbl_CNautique: TLabel
      Left = 24
      Top = 181
      Width = 106
      Height = 13
      Caption = 'Cr'#233'puscule Nautique :'
    end
    object Bevel1: TBevel
      Left = 51
      Top = 76
      Width = 227
      Height = 2
    end
    object Bevel2: TBevel
      Left = 51
      Top = 144
      Width = 227
      Height = 2
    end
    object Bevel3: TBevel
      Left = 51
      Top = 209
      Width = 227
      Height = 2
    end
    object Lbl_AAstro: TLabel
      Left = 24
      Top = 222
      Width = 101
      Height = 13
      Caption = 'Aube Astronomique :'
    end
    object Lbl_CAstro: TLabel
      Left = 24
      Top = 246
      Width = 129
      Height = 13
      Caption = 'Cr'#233'puscule Astronomique :'
    end
    object Val_AAstro: TLabel
      Left = 164
      Top = 222
      Width = 6
      Height = 13
      Caption = 'x'
    end
    object Val_CAstro: TLabel
      Left = 164
      Top = 246
      Width = 6
      Height = 13
      Caption = 'x'
    end
  end
  object BtnFermer: TButton
    Left = 171
    Top = 329
    Width = 75
    Height = 25
    Caption = 'Fermer'
    ModalResult = 1
    TabOrder = 1
  end
end
