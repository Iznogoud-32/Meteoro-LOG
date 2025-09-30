program WeatherLOG;

{$IFDEF DEBUG}
  {$DEFINE EnableMemoryLeakReporting}
{$ENDIF}

uses
  Vcl.Forms,
  WeatherTypes in 'Models\WeatherTypes.pas',
  StationService in 'Business\StationService.pas',
  ValidationService in 'Business\ValidationService.pas',
  DatabaseManager in 'DataAccess\DatabaseManager.pas',
  MainPresenter in 'Presenters\MainPresenter.pas',
  StationPresenter in 'Presenters\StationPresenter.pas',
  Main in 'View\Main.pas' {FrmMain},
  SensorForm in 'View\SensorForm.pas' {frmSensorForm},
  StationForm in 'View\StationForm.pas' {frmStationForm},
  StationDetailPresenter in 'Presenters\StationDetailPresenter.pas',
  StationDetailForm in 'View\StationDetailForm.pas' {frmStationDetail},
  WeatherEntryService in 'Business\WeatherEntryService.pas',
  WeatherEntryPresenter in 'Presenters\WeatherEntryPresenter.pas',
  WeatherEntryForm in 'View\WeatherEntryForm.pas' {frmWeatherEntry},
  MoonDetails in 'View\MoonDetails.pas' {MoonForm},
  SunDetails in 'View\SunDetails.pas' {SunForm},
  Almanac in 'Business\Almanac.pas';

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


