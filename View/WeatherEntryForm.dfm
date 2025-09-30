object frmWeatherEntry: TfrmWeatherEntry
  Left = 0
  Top = 0
  Caption = 'Weather Entry'
  ClientHeight = 765
  ClientWidth = 819
  Color = 16316922
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  TextHeight = 15
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 819
    Height = 765
    Align = alClient
    BevelOuter = bvNone
    Color = 16316922
    ParentBackground = False
    TabOrder = 0
    object pnlHeader: TPanel
      Left = 0
      Top = 0
      Width = 819
      Height = 80
      Align = alTop
      BevelOuter = bvLowered
      Color = clWhite
      ParentBackground = False
      TabOrder = 0
      object lblFormTitle: TLabel
        Left = 24
        Top = 16
        Width = 187
        Height = 30
        Caption = 'Add Weather Entry'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 2172201
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblFormDescription: TLabel
        Left = 24
        Top = 45
        Width = 234
        Height = 15
        Caption = 'Enter the weather data measurements below'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7107965
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
    end
    object pnlContent: TPanel
      Left = 0
      Top = 80
      Width = 819
      Height = 625
      Align = alClient
      BevelOuter = bvNone
      Color = 16316922
      ParentBackground = False
      TabOrder = 1
      object gbEntryDetails: TGroupBox
        Left = 24
        Top = 24
        Width = 777
        Height = 586
        Caption = ' Weather Entry Details '
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        object lblStation: TLabel
          Left = 24
          Top = 32
          Width = 40
          Height = 13
          Caption = 'Station:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object pnlDateTime: TPanel
          Left = 24
          Top = 76
          Width = 737
          Height = 80
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object lblTimestamp: TLabel
            Left = 0
            Top = 8
            Width = 54
            Height = 13
            Caption = 'Date/Time:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
          end
          object dtpDate: TDateTimePicker
            Left = 4
            Top = 27
            Width = 120
            Height = 21
            Date = 45311.000000000000000000
            Time = 0.489444444443506700
            TabOrder = 0
          end
          object dtpTime: TDateTimePicker
            Left = 135
            Top = 27
            Width = 80
            Height = 21
            Date = 45311.000000000000000000
            Format = 'HH:mm'
            Time = 0.489444444443506700
            Kind = dtkTime
            TabOrder = 1
          end
        end
        object cmbStation: TComboBoxEx
          Left = 24
          Top = 48
          Width = 300
          Height = 22
          ItemsEx = <>
          Color = 16316922
          TabOrder = 1
          OnChange = cmbStationChange
        end
        object AdvPnlWeatherEntry: TAdvPanelGroup
          Left = 24
          Top = 168
          Width = 737
          Height = 406
          Color = clWhite
          TabOrder = 2
          UseDockManager = True
          Version = '2.7.0.1'
          BorderColor = clBlack
          Caption.Color = clWhite
          Caption.ColorTo = clNone
          Caption.Font.Charset = DEFAULT_CHARSET
          Caption.Font.Color = clNone
          Caption.Font.Height = -11
          Caption.Font.Name = 'Segoe UI'
          Caption.Font.Style = []
          Caption.GradientDirection = gdVertical
          Caption.Indent = 0
          Caption.ShadeLight = 255
          CollapsColor = clNone
          CollapsDelay = 0
          DoubleBuffered = False
          ShadowColor = clBlack
          ShadowOffset = 0
          StatusBar.BorderColor = clNone
          StatusBar.BorderStyle = bsSingle
          StatusBar.Font.Charset = DEFAULT_CHARSET
          StatusBar.Font.Color = 4473924
          StatusBar.Font.Height = -11
          StatusBar.Font.Name = 'Segoe UI'
          StatusBar.Font.Style = []
          StatusBar.Color = clWhite
          StatusBar.GradientDirection = gdVertical
          Text = ''
          Columns = 1
          DefaultPanel.AnchorHint = False
          DefaultPanel.BevelInner = bvNone
          DefaultPanel.BevelOuter = bvNone
          DefaultPanel.BevelWidth = 1
          DefaultPanel.BorderColor = clBlack
          DefaultPanel.BorderShadow = False
          DefaultPanel.BorderStyle = bsSingle
          DefaultPanel.BorderWidth = 0
          DefaultPanel.BottomIndent = 0
          DefaultPanel.CanMove = False
          DefaultPanel.CanSize = False
          DefaultPanel.Caption.Color = clHighlight
          DefaultPanel.Caption.ColorTo = clNone
          DefaultPanel.Caption.Font.Charset = DEFAULT_CHARSET
          DefaultPanel.Caption.Font.Color = clHighlightText
          DefaultPanel.Caption.Font.Height = -11
          DefaultPanel.Caption.Font.Name = 'Segoe UI'
          DefaultPanel.Caption.Font.Style = []
          DefaultPanel.Caption.Indent = 0
          DefaultPanel.Collaps = False
          DefaultPanel.CollapsColor = clBtnFace
          DefaultPanel.CollapsDelay = 0
          DefaultPanel.CollapsSteps = 0
          DefaultPanel.Color = clBtnFace
          DefaultPanel.ColorTo = clNone
          DefaultPanel.ColorMirror = clNone
          DefaultPanel.ColorMirrorTo = clNone
          DefaultPanel.Cursor = crDefault
          DefaultPanel.Font.Charset = DEFAULT_CHARSET
          DefaultPanel.Font.Color = clWindowText
          DefaultPanel.Font.Height = -11
          DefaultPanel.Font.Name = 'Segoe UI'
          DefaultPanel.Font.Style = []
          DefaultPanel.FixedTop = False
          DefaultPanel.FixedLeft = False
          DefaultPanel.FixedHeight = False
          DefaultPanel.FixedWidth = False
          DefaultPanel.Height = 120
          DefaultPanel.Hover = False
          DefaultPanel.HoverColor = clNone
          DefaultPanel.HoverFontColor = clNone
          DefaultPanel.Indent = 0
          DefaultPanel.ShadowColor = clBlack
          DefaultPanel.ShadowOffset = 0
          DefaultPanel.ShowHint = False
          DefaultPanel.ShowMoveCursor = False
          DefaultPanel.StatusBar.Font.Charset = DEFAULT_CHARSET
          DefaultPanel.StatusBar.Font.Color = clWindowText
          DefaultPanel.StatusBar.Font.Height = -11
          DefaultPanel.StatusBar.Font.Name = 'Segoe UI'
          DefaultPanel.StatusBar.Font.Style = []
          DefaultPanel.TextVAlign = tvaTop
          DefaultPanel.TopIndent = 0
          DefaultPanel.URLColor = clBlue
          DefaultPanel.Width = 0
          GroupStyle = gsVertical
          MouseWheelDelta = 0
          HorzPadding = 8
          VertPadding = 8
          FullHeight = 200
          object AdvPnlRadiation: TAdvPanel
            Left = 8
            Top = 66
            Width = 721
            Height = 21
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            UseDockManager = True
            Version = '2.7.0.1'
            BorderColor = clBlack
            CanMove = True
            Caption.Color = clGradientActiveCaption
            Caption.ColorTo = clGradientActiveCaption
            Caption.CloseButtonColor = clBlack
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clGrayText
            Caption.Font.Height = -11
            Caption.Font.Name = 'Segoe UI'
            Caption.Font.Style = [fsBold]
            Caption.GradientDirection = gdVertical
            Caption.Height = 23
            Caption.Indent = 4
            Caption.MaxGlyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF}
            Caption.MinGlyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
              00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000000000000000000000000000000000000000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000000000000000000000000000FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            Caption.MinMaxButton = True
            Caption.MinMaxButtonColor = clBlack
            Caption.ShadeLight = 255
            Caption.Text = 'Radiation Parameters'
            Caption.TopIndent = 4
            Caption.Visible = True
            Collaps = True
            CollapsColor = clNone
            CollapsDelay = 0
            DoubleBuffered = True
            ShadowColor = clBlack
            ShadowOffset = 0
            StatusBar.BorderColor = clNone
            StatusBar.BorderStyle = bsSingle
            StatusBar.Font.Charset = DEFAULT_CHARSET
            StatusBar.Font.Color = clWindowText
            StatusBar.Font.Height = -11
            StatusBar.Font.Name = 'Segoe UI'
            StatusBar.Font.Style = []
            StatusBar.Color = clWhite
            StatusBar.GradientDirection = gdVertical
            Text = ''
            FullHeight = 163
            object gbSolarRadiation: TGroupBox
              Left = 0
              Top = 32
              Width = 150
              Height = 120
              Caption = 'Global Solar Radiation'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
              Visible = False
              object lblSolarRadiation: TLabel
                Left = 16
                Top = 32
                Width = 31
                Height = 13
                Caption = 'Value:'
              end
              object lblSolarRadiationUnit: TLabel
                Left = 16
                Top = 80
                Width = 26
                Height = 13
                Caption = 'w/m'#178
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 7104349
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object edtSolarRadiation: TEdit
                Left = 16
                Top = 48
                Width = 100
                Height = 21
                Color = 16316922
                TabOrder = 0
              end
            end
            object gbUVRadiation: TGroupBox
              Left = 170
              Top = 32
              Width = 150
              Height = 120
              Caption = 'UV Radiation'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 1
              Visible = False
              object lblUVRadiation: TLabel
                Left = 16
                Top = 32
                Width = 31
                Height = 13
                Caption = 'Value:'
              end
              object lblUVRadiationUnit: TLabel
                Left = 16
                Top = 80
                Width = 26
                Height = 13
                Caption = 'w/m'#178
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 7104349
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object edtUVRadiation: TEdit
                Left = 16
                Top = 48
                Width = 100
                Height = 21
                Color = 16316922
                TabOrder = 0
              end
            end
            object gbInfraredRadiation: TGroupBox
              Left = 340
              Top = 32
              Width = 150
              Height = 120
              Caption = 'Infrared Radiation'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 2
              Visible = False
              object lblInfraredRadiation: TLabel
                Left = 16
                Top = 32
                Width = 31
                Height = 13
                Caption = 'Value:'
              end
              object lblInfraredRadiationUnit: TLabel
                Left = 16
                Top = 80
                Width = 26
                Height = 13
                Caption = 'w/m'#178
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 7104349
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object edtInfraredRadiation: TEdit
                Left = 16
                Top = 48
                Width = 100
                Height = 21
                Color = 16316922
                TabOrder = 0
              end
            end
          end
          object AdvPnlWind: TAdvPanel
            Left = 8
            Top = 37
            Width = 721
            Height = 21
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            UseDockManager = True
            Version = '2.7.0.1'
            BorderColor = clBlack
            CanMove = True
            Caption.Color = clGradientActiveCaption
            Caption.ColorTo = clGradientActiveCaption
            Caption.CloseButtonColor = clBlack
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clGrayText
            Caption.Font.Height = -11
            Caption.Font.Name = 'Segoe UI'
            Caption.Font.Style = [fsBold]
            Caption.GradientDirection = gdVertical
            Caption.Height = 23
            Caption.Indent = 4
            Caption.MaxGlyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF}
            Caption.MinGlyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
              00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000000000000000000000000000000000000000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000000000000000000000000000FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            Caption.MinMaxButton = True
            Caption.MinMaxButtonColor = clBlack
            Caption.ShadeLight = 255
            Caption.Text = 'Wind'
            Caption.TopIndent = 4
            Caption.Visible = True
            Collaps = True
            CollapsColor = clNone
            CollapsDelay = 0
            DoubleBuffered = True
            ShadowColor = clBlack
            ShadowOffset = 0
            StatusBar.BorderColor = clNone
            StatusBar.BorderStyle = bsSingle
            StatusBar.Font.Charset = DEFAULT_CHARSET
            StatusBar.Font.Color = clWindowText
            StatusBar.Font.Height = -11
            StatusBar.Font.Name = 'Segoe UI'
            StatusBar.Font.Style = []
            StatusBar.Color = clWhite
            StatusBar.GradientDirection = gdVertical
            Text = ''
            FullHeight = 160
            object gbWindDirection: TGroupBox
              Left = 340
              Top = 32
              Width = 150
              Height = 120
              Caption = ' Wind Direction '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
              Visible = False
              object lblWindDirection: TLabel
                Left = 16
                Top = 32
                Width = 50
                Height = 13
                Caption = 'Direction:'
              end
              object cmbWindDirection: TComboBox
                Left = 16
                Top = 48
                Width = 100
                Height = 21
                Style = csDropDownList
                Color = 16316922
                TabOrder = 0
                Items.Strings = (
                  'N'
                  'NNE'
                  'NE'
                  'ENE'
                  'E'
                  'ESE'
                  'SE'
                  'SSE'
                  'S'
                  'SSW'
                  'SW'
                  'WSW'
                  'W'
                  'WNW'
                  'NW'
                  'NNW')
              end
            end
            object gbWindGust: TGroupBox
              Left = 170
              Top = 32
              Width = 150
              Height = 120
              Caption = ' Wind Gust '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 1
              Visible = False
              object lblWindGust: TLabel
                Left = 16
                Top = 32
                Width = 31
                Height = 13
                Caption = 'Value:'
              end
              object lblWindGustUnit: TLabel
                Left = 16
                Top = 80
                Width = 26
                Height = 13
                Caption = 'km/h'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 7104349
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object edtWindGust: TEdit
                Left = 16
                Top = 48
                Width = 100
                Height = 21
                Color = 16316922
                TabOrder = 0
                Text = '0'
              end
            end
            object gbWindSpeed: TGroupBox
              Left = 0
              Top = 32
              Width = 150
              Height = 120
              Caption = ' Wind Speed '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 2
              Visible = False
              object lblWindSpeed: TLabel
                Left = 16
                Top = 32
                Width = 31
                Height = 13
                Caption = 'Value:'
              end
              object lblWindSpeedUnit: TLabel
                Left = 16
                Top = 80
                Width = 26
                Height = 13
                Caption = 'km/h'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 7104349
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object edtWindSpeed: TEdit
                Left = 16
                Top = 48
                Width = 100
                Height = 21
                Color = 16316922
                TabOrder = 0
              end
            end
          end
          object AdvPnlBaseParameters: TAdvPanel
            Left = 8
            Top = 8
            Width = 721
            Height = 21
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            UseDockManager = True
            Version = '2.7.0.1'
            BorderColor = clBlack
            CanMove = True
            Caption.Color = clGradientActiveCaption
            Caption.ColorTo = clGradientActiveCaption
            Caption.CloseButtonColor = clBlack
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clGrayText
            Caption.Font.Height = -11
            Caption.Font.Name = 'Segoe UI'
            Caption.Font.Style = [fsBold]
            Caption.GradientDirection = gdVertical
            Caption.Height = 23
            Caption.Indent = 4
            Caption.MaxGlyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF}
            Caption.MinGlyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
              00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000000000000000000000000000000000000000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000000000000000000000000000FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            Caption.MinMaxButton = True
            Caption.MinMaxButtonColor = clBlack
            Caption.ShadeLight = 255
            Caption.Text = 'Base Parameters'
            Caption.TopIndent = 4
            Caption.Visible = True
            Collaps = True
            CollapsColor = clNone
            CollapsDelay = 0
            DoubleBuffered = True
            ShadowColor = clBlack
            ShadowOffset = 0
            StatusBar.BorderColor = clNone
            StatusBar.BorderStyle = bsSingle
            StatusBar.Font.Charset = DEFAULT_CHARSET
            StatusBar.Font.Color = clWindowText
            StatusBar.Font.Height = -11
            StatusBar.Font.Name = 'Segoe UI'
            StatusBar.Font.Style = []
            StatusBar.Color = clWhite
            StatusBar.GradientDirection = gdVertical
            Text = ''
            FullHeight = 237
            object gbHumidity: TGroupBox
              Left = 186
              Top = 32
              Width = 150
              Height = 120
              Caption = ' Humidity '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
              Visible = False
              object lblHumidity: TLabel
                Left = 16
                Top = 32
                Width = 31
                Height = 13
                Caption = 'Value:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object lblHumidityUnit: TLabel
                Left = 16
                Top = 80
                Width = 9
                Height = 13
                Caption = '%'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 7107965
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object edtHumidity: TEdit
                Left = 16
                Top = 48
                Width = 100
                Height = 21
                Color = 16316922
                TabOrder = 0
              end
            end
            object gbPrecipitations: TGroupBox
              Left = 562
              Top = 32
              Width = 150
              Height = 120
              Caption = ' Precipitations'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 1
              Visible = False
              object lblPrecipitations: TLabel
                Left = 16
                Top = 32
                Width = 31
                Height = 13
                Caption = 'Value:'
              end
              object lblPrecipitationsUnit: TLabel
                Left = 16
                Top = 80
                Width = 18
                Height = 13
                Caption = 'mm'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 7107965
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object edtPrecipitations: TEdit
                Left = 16
                Top = 48
                Width = 100
                Height = 21
                Color = 16316922
                TabOrder = 0
              end
            end
            object gbPressure: TGroupBox
              Left = 372
              Top = 32
              Width = 150
              Height = 120
              Caption = ' Pressure '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 2
              Visible = False
              object lblPressure: TLabel
                Left = 16
                Top = 32
                Width = 31
                Height = 13
                Caption = 'Value:'
              end
              object lblPressureUnit: TLabel
                Left = 16
                Top = 80
                Width = 19
                Height = 13
                Caption = 'hPa'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 7107965
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object edtPressure: TEdit
                Left = 16
                Top = 48
                Width = 100
                Height = 21
                Color = 16316922
                TabOrder = 0
              end
            end
            object gbTemperature: TGroupBox
              Left = 0
              Top = 32
              Width = 150
              Height = 120
              Caption = ' Temperature '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 3
              Visible = False
              object lblTemperature: TLabel
                Left = 16
                Top = 32
                Width = 31
                Height = 13
                Caption = 'Value:'
              end
              object lblTempUnit: TLabel
                Left = 16
                Top = 80
                Width = 11
                Height = 13
                Caption = #176'C'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 7104349
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object edtTemperature: TEdit
                Left = 16
                Top = 48
                Width = 100
                Height = 21
                Color = 16316922
                TabOrder = 0
              end
            end
            object gbConditions: TGroupBox
              Left = 0
              Top = 167
              Width = 200
              Height = 60
              Caption = ' Weather Conditions '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 4
              Visible = False
              object lblConditions: TLabel
                Left = 16
                Top = 24
                Width = 60
                Height = 13
                Caption = 'Conditions:'
              end
              object cmbConditions: TComboBox
                Left = 80
                Top = 21
                Width = 100
                Height = 21
                Style = csDropDownList
                Color = 16316922
                TabOrder = 0
                Items.Strings = (
                  'clear'
                  'cloudy'
                  'overcast'
                  'rain'
                  'drizzle'
                  'thunderstorm'
                  'snow'
                  'fog'
                  'mist'
                  'windy')
              end
            end
            object gbNotes: TGroupBox
              Left = 228
              Top = 167
              Width = 484
              Height = 60
              Caption = ' Notes '
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 5
              Visible = False
              object lblNotes: TLabel
                Left = 16
                Top = 24
                Width = 81
                Height = 13
                Caption = 'Additional info:'
              end
              object memoNotes: TMemo
                Left = 100
                Top = 20
                Width = 365
                Height = 25
                Color = 16316922
                ScrollBars = ssVertical
                TabOrder = 0
              end
            end
          end
          object AdvPnlCloud: TAdvPanel
            Left = 8
            Top = 95
            Width = 721
            Height = 21
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            UseDockManager = True
            Version = '2.7.0.1'
            BorderColor = clBlack
            CanMove = True
            Caption.Color = clGradientActiveCaption
            Caption.ColorTo = clGradientActiveCaption
            Caption.CloseButtonColor = clBlack
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clGrayText
            Caption.Font.Height = -11
            Caption.Font.Name = 'Segoe UI'
            Caption.Font.Style = [fsBold]
            Caption.GradientDirection = gdVertical
            Caption.Height = 23
            Caption.Indent = 4
            Caption.MaxGlyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF}
            Caption.MinGlyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
              00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000000000000000000000000000000000000000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000000000000000000000000000FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            Caption.MinMaxButton = True
            Caption.MinMaxButtonColor = clBlack
            Caption.ShadeLight = 255
            Caption.Text = 'Visibility and Cloud Parameters'
            Caption.TopIndent = 4
            Caption.Visible = True
            Collaps = True
            CollapsColor = clNone
            CollapsDelay = 0
            DoubleBuffered = True
            ShadowColor = clBlack
            ShadowOffset = 0
            StatusBar.BorderColor = clNone
            StatusBar.BorderStyle = bsSingle
            StatusBar.Font.Charset = DEFAULT_CHARSET
            StatusBar.Font.Color = clWindowText
            StatusBar.Font.Height = -11
            StatusBar.Font.Name = 'Segoe UI'
            StatusBar.Font.Style = []
            StatusBar.Color = clWhite
            StatusBar.GradientDirection = gdVertical
            Text = ''
            FullHeight = 166
            object gbVisibility: TGroupBox
              Left = 0
              Top = 32
              Width = 150
              Height = 120
              Caption = 'Horizontal Visibility'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
              Visible = False
              object lblVisibility: TLabel
                Left = 16
                Top = 32
                Width = 31
                Height = 13
                Caption = 'Value:'
              end
              object lblVisibilityUnit: TLabel
                Left = 16
                Top = 80
                Width = 9
                Height = 13
                Caption = 'm'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 7104349
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object edtVisibility: TEdit
                Left = 16
                Top = 48
                Width = 100
                Height = 21
                Color = 16316922
                TabOrder = 0
              end
            end
            object gbCloudCoverage: TGroupBox
              Left = 170
              Top = 32
              Width = 150
              Height = 120
              Caption = 'Cloud Coverage'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 1
              Visible = False
              object lblCloudCoverage: TLabel
                Left = 16
                Top = 32
                Width = 31
                Height = 13
                Caption = 'Value:'
              end
              object lblCloudCoverageUnit: TLabel
                Left = 16
                Top = 80
                Width = 9
                Height = 13
                Caption = '%'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 7104349
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object edtCloudCoverage: TEdit
                Left = 16
                Top = 48
                Width = 100
                Height = 21
                Color = 16316922
                TabOrder = 0
              end
            end
            object gbCloudHeight: TGroupBox
              Left = 340
              Top = 32
              Width = 150
              Height = 120
              Caption = 'Base Cloud Height'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 2
              Visible = False
              object lblCloudHeight: TLabel
                Left = 16
                Top = 32
                Width = 31
                Height = 13
                Caption = 'Value:'
              end
              object lblCloudHeightUnit: TLabel
                Left = 16
                Top = 80
                Width = 9
                Height = 13
                Caption = 'm'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 7104349
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object edtCloudHeight: TEdit
                Left = 16
                Top = 48
                Width = 100
                Height = 21
                Color = 16316922
                TabOrder = 0
              end
            end
            object gbCloudType: TGroupBox
              Left = 512
              Top = 66
              Width = 200
              Height = 60
              Caption = 'Cloud Type'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 3
              Visible = False
              object lblCloudType: TLabel
                Left = 16
                Top = 24
                Width = 30
                Height = 13
                Caption = 'Types:'
              end
              object cbCloudType: TComboBox
                Left = 52
                Top = 21
                Width = 128
                Height = 21
                Style = csDropDownList
                Color = 16316922
                TabOrder = 0
                Items.Strings = (
                  'Cirrus'
                  'CirroStratus'
                  'AltoStratus'
                  'Stratus'
                  'Cumulus Humilis'
                  'CumuloNimbus'
                  'CirroCumulus'
                  'AltoCumulus'
                  'NimboStratus'
                  'StratoCumulus'
                  'Cumulus congestus')
              end
            end
          end
          object AdvPnlSoil: TAdvPanel
            Left = 8
            Top = 124
            Width = 721
            Height = 21
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
            UseDockManager = True
            Version = '2.7.0.1'
            BorderColor = clBlack
            CanMove = True
            Caption.Color = clGradientActiveCaption
            Caption.ColorTo = clGradientActiveCaption
            Caption.CloseButtonColor = clBlack
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clGrayText
            Caption.Font.Height = -11
            Caption.Font.Name = 'Segoe UI'
            Caption.Font.Style = [fsBold]
            Caption.GradientDirection = gdVertical
            Caption.Height = 23
            Caption.Indent = 4
            Caption.MaxGlyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF}
            Caption.MinGlyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
              00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000000000000000000000000000000000000000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000000000000000000000000000FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            Caption.MinMaxButton = True
            Caption.MinMaxButtonColor = clBlack
            Caption.ShadeLight = 255
            Caption.Text = 'Soil and Surface Parameters'
            Caption.TopIndent = 4
            Caption.Visible = True
            Collaps = True
            CollapsColor = clNone
            CollapsDelay = 0
            DoubleBuffered = True
            ShadowColor = clBlack
            ShadowOffset = 0
            StatusBar.BorderColor = clNone
            StatusBar.BorderStyle = bsSingle
            StatusBar.Font.Charset = DEFAULT_CHARSET
            StatusBar.Font.Color = clWindowText
            StatusBar.Font.Height = -11
            StatusBar.Font.Name = 'Segoe UI'
            StatusBar.Font.Style = []
            StatusBar.Color = clWhite
            StatusBar.GradientDirection = gdVertical
            Text = ''
            FullHeight = 186
            object gbSnowDepth: TGroupBox
              Left = 505
              Top = 32
              Width = 150
              Height = 120
              Caption = 'Snow Depth'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
              Visible = False
              object lbSnowDepth: TLabel
                Left = 16
                Top = 32
                Width = 31
                Height = 13
                Caption = 'Value:'
              end
              object lblSnowDepthUnit: TLabel
                Left = 16
                Top = 80
                Width = 18
                Height = 13
                Caption = 'mm'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 7107965
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object edtSnowDepth: TEdit
                Left = 16
                Top = 48
                Width = 100
                Height = 21
                Color = 16316922
                TabOrder = 0
              end
            end
            object gbSoilTemperature: TGroupBox
              Left = 0
              Top = 32
              Width = 150
              Height = 120
              Caption = 'Soil Temperature'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 1
              Visible = False
              object lblSoilTemperature: TLabel
                Left = 16
                Top = 32
                Width = 31
                Height = 13
                Caption = 'Value:'
              end
              object lblSoilTemperatureUnit: TLabel
                Left = 16
                Top = 80
                Width = 11
                Height = 13
                Caption = #176'C'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 7107965
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object edtSoilTemperature: TEdit
                Left = 16
                Top = 48
                Width = 100
                Height = 21
                Color = 16316922
                TabOrder = 0
              end
            end
            object gbSoilMoisture: TGroupBox
              Left = 170
              Top = 32
              Width = 150
              Height = 120
              Caption = 'Soil Moisture'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 2
              Visible = False
              object lblSoilMoisture: TLabel
                Left = 16
                Top = 32
                Width = 31
                Height = 13
                Caption = 'Value:'
              end
              object lblSoilMoistureUnit: TLabel
                Left = 16
                Top = 80
                Width = 9
                Height = 13
                Caption = '%'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 7107965
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object edtSoilMoisture: TEdit
                Left = 16
                Top = 48
                Width = 100
                Height = 21
                Color = 16316922
                TabOrder = 0
              end
            end
            object gbDewPoint: TGroupBox
              Left = 338
              Top = 32
              Width = 150
              Height = 120
              Caption = 'Dew Point'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 3
              Visible = False
              object lblDewPoint: TLabel
                Left = 16
                Top = 32
                Width = 31
                Height = 13
                Caption = 'Value:'
              end
              object lblDewPointUnit: TLabel
                Left = 16
                Top = 80
                Width = 11
                Height = 13
                Caption = #176'C'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = 7107965
                Font.Height = -11
                Font.Name = 'Segoe UI'
                Font.Style = []
                ParentFont = False
              end
              object edtDewPoint: TEdit
                Left = 16
                Top = 48
                Width = 100
                Height = 21
                Color = 16316922
                TabOrder = 0
              end
            end
          end
          object AdvPnlAQI: TAdvPanel
            Left = 8
            Top = 153
            Width = 721
            Height = 21
            Color = clWhite
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            UseDockManager = True
            Version = '2.7.0.1'
            BorderColor = clBlack
            CanMove = True
            Caption.Color = clGradientActiveCaption
            Caption.ColorTo = clGradientActiveCaption
            Caption.CloseButtonColor = clBlack
            Caption.Font.Charset = DEFAULT_CHARSET
            Caption.Font.Color = clGrayText
            Caption.Font.Height = -11
            Caption.Font.Name = 'Segoe UI'
            Caption.Font.Style = [fsBold]
            Caption.GradientDirection = gdVertical
            Caption.Height = 23
            Caption.Indent = 4
            Caption.MaxGlyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFF000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000
              00000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFF}
            Caption.MinGlyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
              00000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000000000000000000000000000000000000000FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000000000000000000000000000FFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
              0000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000FF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            Caption.MinMaxButton = True
            Caption.MinMaxButtonColor = clBlack
            Caption.ShadeLight = 255
            Caption.Text = 'Air Quality Parameters'
            Caption.TopIndent = 4
            Caption.Visible = True
            Collaps = True
            CollapsColor = clNone
            CollapsDelay = 0
            DoubleBuffered = True
            ShadowColor = clBlack
            ShadowOffset = 0
            StatusBar.BorderColor = clNone
            StatusBar.BorderStyle = bsSingle
            StatusBar.Font.Charset = DEFAULT_CHARSET
            StatusBar.Font.Color = clWindowText
            StatusBar.Font.Height = -11
            StatusBar.Font.Name = 'Segoe UI'
            StatusBar.Font.Style = []
            StatusBar.Color = clWhite
            StatusBar.GradientDirection = gdVertical
            Text = ''
            FullHeight = 121
            object gbAQI: TGroupBox
              Left = 0
              Top = 37
              Width = 200
              Height = 60
              Caption = 'Air Quality Index'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentBackground = False
              ParentFont = False
              TabOrder = 0
              Visible = False
              object lblAQI: TLabel
                Left = 16
                Top = 24
                Width = 31
                Height = 13
                Caption = 'Index:'
              end
              object cbAQI: TComboBox
                Left = 52
                Top = 21
                Width = 128
                Height = 21
                Style = csDropDownList
                Color = 16316922
                TabOrder = 0
                Items.Strings = (
                  'Very Good'
                  'Good'
                  'Fair'
                  'Poor'
                  'Very Poor'
                  'Hazardous')
              end
            end
          end
        end
      end
    end
    object pnlButtons: TPanel
      Left = 0
      Top = 705
      Width = 819
      Height = 60
      Align = alBottom
      BevelOuter = bvLowered
      Color = clWhite
      ParentBackground = False
      TabOrder = 2
      object btnOK: TButton
        Left = 516
        Top = 16
        Width = 80
        Height = 32
        Caption = 'OK'
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = btnOKClick
      end
      object btnCancel: TButton
        Left = 608
        Top = 16
        Width = 80
        Height = 32
        Cancel = True
        Caption = 'Cancel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnCancelClick
      end
      object btnClear: TButton
        Left = 424
        Top = 16
        Width = 80
        Height = 32
        Caption = 'Clear'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        OnClick = btnClearClick
      end
    end
  end
end
