program WeatherLOG;

{$IFDEF DEBUG}
  {$DEFINE EnableMemoryLeakReporting}
{$ENDIF}

uses
  Vcl.Forms,
  WeatherTypes in 'Models\WeatherTypes.pas',
  Almanac in 'Business\Almanac.pas',
  StationService in 'Business\StationService.pas',
  ValidationService in 'Business\ValidationService.pas',
  WeatherEntryService in 'Business\WeatherEntryService.pas',
  DatabaseManager in 'DataAccess\DatabaseManager.pas',
  MainPresenter in 'Presenters\MainPresenter.pas',
  StationDetailPresenter in 'Presenters\StationDetailPresenter.pas',
  StationPresenter in 'Presenters\StationPresenter.pas',
  WeatherEntryPresenter in 'Presenters\WeatherEntryPresenter.pas',
  Main in 'View\Main.pas' {FrmMain},
  MoonDetails in 'View\MoonDetails.pas' {MoonForm},
  SensorForm in 'View\SensorForm.pas' {frmSensorForm},
  StationDetailForm in 'View\StationDetailForm.pas' {frmStationDetail},
  StationForm in 'View\StationForm.pas' {frmStationForm},
  SunDetails in 'View\SunDetails.pas' {SunForm},
  WeatherEntryForm in 'View\WeatherEntryForm.pas' {frmWeatherEntry};

{$R *.res}

begin
  Application.Initialize;
  {$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
  {$ENDIF}
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.


