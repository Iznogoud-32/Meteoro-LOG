unit StationService;

interface

uses
  System.SysUtils, System.Generics.Collections, System.Classes,
  WeatherTypes, DatabaseManager;

type
  TStationFilter = record
    SearchText: string;
    StationType: TStationType;
    Status: TStationStatus;
    class function All: TStationFilter; static;
  end;

  TStationStatistics = record
    Total: Integer;
    Active: Integer;
    Maintenance: Integer;
    Error: Integer;
    Inactive: Integer;
    Testing: Integer;
  end;

  TStationService = class
  private
    FDatabase: TDatabaseManager;
  public
    constructor Create(ADatabase: TDatabaseManager);
    
    property Database: TDatabaseManager read FDatabase;    
    
    // CRUD Operations
    function GetAllStations: TWeatherStationList;
    function GetStation(const AID: string): TWeatherStation;
    function CreateStation(const AStation: TWeatherStation): Boolean;
    function UpdateStation(const AStation: TWeatherStation): Boolean;
    function DeleteStation(const AID: string): Boolean;
    
    // Filtering and Search
    function FilterStations(const AFilter: TStationFilter): TWeatherStationList;
    function SearchStations(const ASearchText: string): TWeatherStationList;
    function GetActiveStations: TWeatherStationList;
    
    // Statistics
    function GetStatistics: TStationStatistics;
    
    // Business Rules
    function CanDeleteStation(const AID: string; out Reason: string): Boolean;
    function ValidateStation(const AStation: TWeatherStation; out Errors: TStringList): Boolean;
    function HasWeatherData(const AStationID: string): Boolean;
    function GetStationSensors(const AStationID: string): TWeatherStationSensorList;
  end;

implementation

{ TStationFilter }

class function TStationFilter.All: TStationFilter;
begin
  Result.SearchText := '';
  Result.StationType := TStationType(-1);
  Result.Status := TStationStatus(-1);
end;

{ TStationService }

constructor TStationService.Create(ADatabase: TDatabaseManager);
begin
  inherited Create;
  if not Assigned(ADatabase) then
    raise Exception.Create('Database manager is required');
  FDatabase := ADatabase;
end;

function TStationService.GetAllStations: TWeatherStationList;
begin
  Result := FDatabase.GetAllStations;
end;

function TStationService.GetStation(const AID: string): TWeatherStation;
var
  AllStations: TWeatherStationList;
  Station: TWeatherStation;
begin
  Result := nil;
  AllStations := FDatabase.GetAllStations;
  try
    for Station in AllStations do
    begin
      if Station.ID = AID then
      begin
        Result := Station.Clone;
        Break;
      end;
    end;
  finally
    AllStations.Free;
  end;
end;

function TStationService.CreateStation(const AStation: TWeatherStation): Boolean;
var
  Errors: TStringList;
begin
  Errors := TStringList.Create;
  try
    if not ValidateStation(AStation, Errors) then
      raise Exception.Create('Validation failed:'#13#10 + Errors.Text);
      
    Result := FDatabase.AddStation(AStation);
  finally
    Errors.Free;
  end;
end;

function TStationService.UpdateStation(const AStation: TWeatherStation): Boolean;
var
  Errors: TStringList;
begin
  Errors := TStringList.Create;
  try
    if not ValidateStation(AStation, Errors) then
      raise Exception.Create('Validation failed:'#13#10 + Errors.Text);
      
    Result := FDatabase.UpdateStation(AStation);
  finally
    Errors.Free;
  end;
end;

function TStationService.DeleteStation(const AID: string): Boolean;
var
  Reason: string;
begin
  if not CanDeleteStation(AID, Reason) then
    raise Exception.Create(Reason);
    
  Result := FDatabase.DeleteStation(AID);
end;

function TStationService.FilterStations(const AFilter: TStationFilter): TWeatherStationList;
begin
  Result := FDatabase.FilterStations(
    AFilter.SearchText,
    AFilter.StationType,
    AFilter.Status
  );
end;

function TStationService.SearchStations(const ASearchText: string): TWeatherStationList;
var
  Filter: TStationFilter;
begin
  Filter := TStationFilter.All;
  Filter.SearchText := ASearchText;
  Result := FilterStations(Filter);
end;

function TStationService.GetActiveStations: TWeatherStationList;
var
  Filter: TStationFilter;
begin
  Filter := TStationFilter.All;
  Filter.Status := ssActive;
  Result := FilterStations(Filter);
end;

function TStationService.GetStatistics: TStationStatistics;
begin
  Result.Total := FDatabase.GetStationCount;
  Result.Active := FDatabase.GetStatusStationCount(ssActive);
  Result.Maintenance := FDatabase.GetStatusStationCount(ssMaintenance);
  Result.Error := FDatabase.GetStatusStationCount(ssError);
  Result.Inactive := FDatabase.GetStatusStationCount(ssInactive);
  Result.Testing := FDatabase.GetStatusStationCount(ssTesting);
end;

function TStationService.CanDeleteStation(const AID: string; out Reason: string): Boolean;
begin
  Result := True;
  Reason := '';
  
  // Business Rule: Cannot delete station with weather data
  if HasWeatherData(AID) then
  begin
    Result := False;
    Reason := 'Cannot delete station with existing weather data. ' +
              'Please delete the weather entries first or archive the station instead.';
  end;
end;

function TStationService.ValidateStation(const AStation: TWeatherStation; 
  out Errors: TStringList): Boolean;
begin
  Errors.Clear;
  
  // Required fields
  if AStation.Name.Trim.IsEmpty then
    Errors.Add('Station name is required');
    
  // Geographic coordinates
  if (AStation.Coordinates.Latitude < -90) or (AStation.Coordinates.Latitude > 90) then
    Errors.Add('Latitude must be between -90 and 90');
    
  if (AStation.Coordinates.Longitude < -180) or (AStation.Coordinates.Longitude > 180) then
    Errors.Add('Longitude must be between -180 and 180');
  
  // Altitude validation (reasonable range)
  if (AStation.Altitude < -500) or (AStation.Altitude > 9000) then
    Errors.Add('Altitude must be between -500m and 9000m');
  
  // Date validations
  if (AStation.InstallationDate > Now) then
    Errors.Add('Installation date cannot be in the future');
    
  if (AStation.LastMaintenance > 0) and (AStation.LastMaintenance > Now) then
    Errors.Add('Last maintenance date cannot be in the future');
    
  if (AStation.NextMaintenance > 0) and 
     (AStation.LastMaintenance > 0) and 
     (AStation.NextMaintenance < AStation.LastMaintenance) then
    Errors.Add('Next maintenance date must be after last maintenance date');
    
  Result := Errors.Count = 0;
end;

function TStationService.HasWeatherData(const AStationID: string): Boolean;
var
  Entries: TWeatherEntryList;
  Entry: TWeatherEntry;
begin
  Result := False;
  Entries := FDatabase.GetAllWeatherEntries;
  try
    for Entry in Entries do
    begin
      if Entry.StationID = AStationID then
      begin
        Result := True;
        Break;
      end;
    end;
  finally
    Entries.Free;
  end;
end;

function TStationService.GetStationSensors(const AStationID: string): TWeatherStationSensorList;
begin
  Result := FDatabase.GetStationSensors(AStationID);
end;

end.