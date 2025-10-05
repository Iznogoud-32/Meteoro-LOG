unit StationMapPresenter;

interface

uses
  System.SysUtils, System.Generics.Collections,
  WeatherTypes, StationService;

type
  IStationMapView = interface
    ['{A1B2C3D4-E5F6-7890-1234-567890ABCDEF}']
    procedure DisplayMarkers(const Markers: TStationMarkerList);
    procedure ZoomToMarkers(const Markers: TStationMarkerList);
    procedure CenterOnStation(const Marker: TStationMarker);
    procedure ClearMarkers;
    procedure SetMapZoom(AZoom: Integer);
    procedure ShowError(const Message: string);
    procedure ShowInfo(const Message: string);
  end;

  TStationMapPresenter = class
  private
    FView: IStationMapView;
    FStationService: TStationService;

    function ConvertToMarkers(const Stations: TWeatherStationList): TStationMarkerList;
  public
    constructor Create(AView: IStationMapView; AStationService: TStationService);

    procedure Initialize;
    procedure Refresh;
    procedure FilterByStatus(AStatus: TStationStatus);
    procedure ShowStation(const AStationID: string);
  end;

implementation

{ TStationMapPresenter }

constructor TStationMapPresenter.Create(AView: IStationMapView;
  AStationService: TStationService);
begin
  inherited Create;
  FView := AView;
  FStationService := AStationService;
end;

procedure TStationMapPresenter.Initialize;
var
  Stations: TWeatherStationList;
  Markers: TStationMarkerList;
begin
  try
    Stations := FStationService.GetAllStations;
    try
      Markers := ConvertToMarkers(Stations);
      try
        FView.DisplayMarkers(Markers);
      finally
        Markers.Free;
      end;
    finally
      Stations.Free;
    end;
  except
    on E: Exception do
      FView.ShowError('Error loading stations on map: ' + E.Message);
  end;
end;

procedure TStationMapPresenter.Refresh;
begin
  Initialize;
end;

procedure TStationMapPresenter.FilterByStatus(AStatus: TStationStatus);
var
  Stations: TWeatherStationList;
  Markers: TStationMarkerList;
  Filter: TStationFilter;
begin
  try
    Filter := TStationFilter.All;
    Filter.Status := AStatus;

    Stations := FStationService.FilterStations(Filter);
    try
      Markers := ConvertToMarkers(Stations);
      try
        FView.DisplayMarkers(Markers);
      finally
        Markers.Free;
      end;
    finally
      Stations.Free;
    end;
  except
    on E: Exception do
      FView.ShowError('Error filtering stations: ' + E.Message);
  end;
end;

procedure TStationMapPresenter.ShowStation(const AStationID: string);
var
  Station: TWeatherStation;
  Marker: TStationMarker;
begin
  try
    Station := FStationService.GetStation(AStationID);
    if Assigned(Station) then
    try
      Marker.ID := Station.ID;
      Marker.Name := Station.Name;
      Marker.Latitude := Station.Coordinates.Latitude;
      Marker.Longitude := Station.Coordinates.Longitude;
      Marker.Status := Station.Status;

      FView.CenterOnStation(Marker);
    finally
      Station.Free;
    end
    else
      FView.ShowInfo('Station not found');
  except
    on E: Exception do
      FView.ShowError('Error showing station: ' + E.Message);
  end;
end;

function TStationMapPresenter.ConvertToMarkers(
  const Stations: TWeatherStationList): TStationMarkerList;
var
  Station: TWeatherStation;
  Marker: TStationMarker;
begin
  Result := TStationMarkerList.Create;
  try
    for Station in Stations do
    begin
      Marker.ID := Station.ID;
      Marker.Name := Station.Name;
      Marker.Latitude := Station.Coordinates.Latitude;
      Marker.Longitude := Station.Coordinates.Longitude;
      Marker.Status := Station.Status;

      Result.Add(Marker);
    end;
  except
    Result.Free;
    raise;
  end;
end;

end.
