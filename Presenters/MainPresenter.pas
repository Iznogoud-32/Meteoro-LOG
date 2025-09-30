unit MainPresenter;

interface

uses
  System.SysUtils, System.Generics.Collections,
  WeatherTypes, StationService, WeatherEntryService;

type
  IMainView = interface
    ['{C3D4E5F6-A7B8-9012-3456-7890CDEF1234}']
    procedure UpdateDashboard;
    procedure ShowError(const Message: string);
    procedure ShowInfo(const Message: string);
  end;

  TMainPresenter = class
  private
    FView: IMainView;
    FStationService: TStationService;
    FWeatherEntryService: TWeatherEntryService;
  public
    constructor Create(AView: IMainView; 
                      AStationService: TStationService;
                      AWeatherEntryService: TWeatherEntryService);
    
    procedure Initialize;
    procedure RefreshDashboard;
    
    // Dashboard statistics
    function GetTotalStations: Integer;
    function GetActiveStations: Integer;
    function GetTotalEntries: Integer;
    function GetLastEntryDate: TDateTime;
  end;

implementation

{ TMainPresenter }

constructor TMainPresenter.Create(AView: IMainView; 
  AStationService: TStationService; AWeatherEntryService: TWeatherEntryService);
begin
  inherited Create;
  FView := AView;
  FStationService := AStationService;
  FWeatherEntryService := AWeatherEntryService;
end;

procedure TMainPresenter.Initialize;
begin
  RefreshDashboard;
end;

procedure TMainPresenter.RefreshDashboard;
begin
  try
    FView.UpdateDashboard;
  except
    on E: Exception do
      FView.ShowError('Error refreshing dashboard: ' + E.Message);
  end;
end;

function TMainPresenter.GetTotalStations: Integer;
var
  Stats: TStationStatistics;
begin
  Stats := FStationService.GetStatistics;
  Result := Stats.Total;
end;

function TMainPresenter.GetActiveStations: Integer;
var
  Stats: TStationStatistics;
begin
  Stats := FStationService.GetStatistics;
  Result := Stats.Active;
end;

function TMainPresenter.GetTotalEntries: Integer;
var
  Stats: TWeatherEntryStatistics;
begin
  Stats := FWeatherEntryService.GetStatistics;
  Result := Stats.TotalEntries;
end;

function TMainPresenter.GetLastEntryDate: TDateTime;
var
  Stats: TWeatherEntryStatistics;
begin
  Stats := FWeatherEntryService.GetStatistics;
  Result := Stats.LastEntryDate;
end;

end.