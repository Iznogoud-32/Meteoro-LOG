unit WeatherEntryService;

interface

uses
  System.SysUtils, System.Generics.Collections, System.DateUtils, System.Classes,
  WeatherTypes, DatabaseManager;

type
  TWeatherEntryFilter = record
    StationID: string;
    StartDate: TDateTime;
    EndDate: TDateTime;
    MinTemperature: Double;
    MaxTemperature: Double;
    Conditions: string;
    class function All: TWeatherEntryFilter; static;
  end;

  TWeatherEntryStatistics = record
    TotalEntries: Integer;
    AverageTemperature: Double;
    MinTemperature: Double;
    MaxTemperature: Double;
    AverageHumidity: Double;
    AveragePressure: Double;
    LastEntryDate: TDateTime;
  end;

  TWeatherEntryService = class
  private
    FDatabase: TDatabaseManager;
  public
    constructor Create(ADatabase: TDatabaseManager);
    
    // CRUD Operations
    function GetAllEntries: TWeatherEntryList;
    function GetEntry(const AID: string): TWeatherEntry;
    function CreateEntry(const AEntry: TWeatherEntry): Boolean;
    function UpdateEntry(const AEntry: TWeatherEntry): Boolean;
    function DeleteEntry(const AID: string): Boolean;
    
    // Filtering
    function FilterEntries(const AFilter: TWeatherEntryFilter): TWeatherEntryList;
    function GetEntriesByStation(const AStationID: string): TWeatherEntryList;
    function GetEntriesByDateRange(const AStartDate, AEndDate: TDateTime): TWeatherEntryList;
    
    // Statistics
    function GetStatistics: TWeatherEntryStatistics;
    function GetStationStatistics(const AStationID: string): TWeatherEntryStatistics;
    
    // Business Rules
    function ValidateEntry(const AEntry: TWeatherEntry; out Errors: TStringList): Boolean;
    function CanDeleteEntry(const AID: string; out Reason: string): Boolean;
  end;

implementation

uses
  Math;

{ TWeatherEntryFilter }

class function TWeatherEntryFilter.All: TWeatherEntryFilter;
begin
  Result.StationID := '';
  Result.StartDate := 0;
  Result.EndDate := 0;
  Result.MinTemperature := -999;
  Result.MaxTemperature := 999;
  Result.Conditions := '';
end;

{ TWeatherEntryService }

constructor TWeatherEntryService.Create(ADatabase: TDatabaseManager);
begin
  inherited Create;
  if not Assigned(ADatabase) then
    raise Exception.Create('Database manager is required');
  FDatabase := ADatabase;
end;

function TWeatherEntryService.GetAllEntries: TWeatherEntryList;
begin
  Result := FDatabase.GetAllWeatherEntries;
end;

function TWeatherEntryService.GetEntry(const AID: string): TWeatherEntry;
begin
  Result := FDatabase.GetWeatherEntry(AID);
end;

function TWeatherEntryService.CreateEntry(const AEntry: TWeatherEntry): Boolean;
var
  Errors: TStringList;
begin
  Errors := TStringList.Create;
  try
    if not ValidateEntry(AEntry, Errors) then
      raise Exception.Create('Validation failed:'#13#10 + Errors.Text);
      
    Result := FDatabase.AddWeatherEntry(AEntry);
  finally
    Errors.Free;
  end;
end;

function TWeatherEntryService.UpdateEntry(const AEntry: TWeatherEntry): Boolean;
var
  Errors: TStringList;
begin
  Errors := TStringList.Create;
  try
    if not ValidateEntry(AEntry, Errors) then
      raise Exception.Create('Validation failed:'#13#10 + Errors.Text);
      
    Result := FDatabase.UpdateWeatherEntry(AEntry);
  finally
    Errors.Free;
  end;
end;

function TWeatherEntryService.DeleteEntry(const AID: string): Boolean;
var
  Reason: string;
begin
  if not CanDeleteEntry(AID, Reason) then
    raise Exception.Create(Reason);
    
  Result := FDatabase.DeleteWeatherEntry(AID);
end;

function TWeatherEntryService.FilterEntries(const AFilter: TWeatherEntryFilter): TWeatherEntryList;
var
  AllEntries: TWeatherEntryList;
  Entry: TWeatherEntry;
  Matches: Boolean;
begin
  Result := TWeatherEntryList.Create;
  AllEntries := FDatabase.GetAllWeatherEntries;
  try
    for Entry in AllEntries do
    begin
      Matches := True;
      
      // Filter by station
      if not AFilter.StationID.IsEmpty then
        Matches := Matches and (Entry.StationID = AFilter.StationID);
      
      // Filter by date range
      if AFilter.StartDate > 0 then
        Matches := Matches and (Entry.Timestamp >= AFilter.StartDate);
      if AFilter.EndDate > 0 then
        Matches := Matches and (Entry.Timestamp <= AFilter.EndDate);
      
      // Filter by temperature range
      Matches := Matches and 
                 (Entry.Temperature >= AFilter.MinTemperature) and 
                 (Entry.Temperature <= AFilter.MaxTemperature);
      
      // Filter by conditions
      if not AFilter.Conditions.IsEmpty then
        Matches := Matches and (Entry.Conditions = AFilter.Conditions);
      
      if Matches then
        Result.Add(Entry);
    end;
  finally
    AllEntries.Free;
  end;
end;

function TWeatherEntryService.GetEntriesByStation(const AStationID: string): TWeatherEntryList;
var
  Filter: TWeatherEntryFilter;
begin
  Filter := TWeatherEntryFilter.All;
  Filter.StationID := AStationID;
  Result := FilterEntries(Filter);
end;

function TWeatherEntryService.GetEntriesByDateRange(const AStartDate, 
  AEndDate: TDateTime): TWeatherEntryList;
var
  Filter: TWeatherEntryFilter;
begin
  Filter := TWeatherEntryFilter.All;
  Filter.StartDate := AStartDate;
  Filter.EndDate := AEndDate;
  Result := FilterEntries(Filter);
end;

function TWeatherEntryService.GetStatistics: TWeatherEntryStatistics;
var
  Entries: TWeatherEntryList;
  Entry: TWeatherEntry;
  TempSum, HumSum, PressSum: Double;
begin
  FillChar(Result, SizeOf(Result), 0);
  
  Entries := FDatabase.GetAllWeatherEntries;
  try
    Result.TotalEntries := Entries.Count;
    
    if Entries.Count = 0 then
      Exit;
    
    Result.MinTemperature := MaxDouble;
    Result.MaxTemperature := -MaxDouble;
    TempSum := 0;
    HumSum := 0;
    PressSum := 0;
    
    for Entry in Entries do
    begin
      TempSum := TempSum + Entry.Temperature;
      HumSum := HumSum + Entry.Humidity;
      PressSum := PressSum + Entry.Pressure;
      
      if Entry.Temperature < Result.MinTemperature then
        Result.MinTemperature := Entry.Temperature;
      if Entry.Temperature > Result.MaxTemperature then
        Result.MaxTemperature := Entry.Temperature;
      
      if Entry.Timestamp > Result.LastEntryDate then
        Result.LastEntryDate := Entry.Timestamp;
    end;
    
    Result.AverageTemperature := TempSum / Entries.Count;
    Result.AverageHumidity := HumSum / Entries.Count;
    Result.AveragePressure := PressSum / Entries.Count;
  finally
    Entries.Free;
  end;
end;

function TWeatherEntryService.GetStationStatistics(const AStationID: string): TWeatherEntryStatistics;
var
  Entries: TWeatherEntryList;
  Entry: TWeatherEntry;
  TempSum, HumSum, PressSum: Double;
begin
  FillChar(Result, SizeOf(Result), 0);
  
  Entries := GetEntriesByStation(AStationID);
  try
    Result.TotalEntries := Entries.Count;
    
    if Entries.Count = 0 then
      Exit;
    
    Result.MinTemperature := MaxDouble;
    Result.MaxTemperature := -MaxDouble;
    TempSum := 0;
    HumSum := 0;
    PressSum := 0;
    
    for Entry in Entries do
    begin
      TempSum := TempSum + Entry.Temperature;
      HumSum := HumSum + Entry.Humidity;
      PressSum := PressSum + Entry.Pressure;
      
      if Entry.Temperature < Result.MinTemperature then
        Result.MinTemperature := Entry.Temperature;
      if Entry.Temperature > Result.MaxTemperature then
        Result.MaxTemperature := Entry.Temperature;
      
      if Entry.Timestamp > Result.LastEntryDate then
        Result.LastEntryDate := Entry.Timestamp;
    end;
    
    Result.AverageTemperature := TempSum / Entries.Count;
    Result.AverageHumidity := HumSum / Entries.Count;
    Result.AveragePressure := PressSum / Entries.Count;
  finally
    Entries.Free;
  end;
end;

function TWeatherEntryService.ValidateEntry(const AEntry: TWeatherEntry; 
  out Errors: TStringList): Boolean;
begin
  Errors.Clear;
  
  // Station ID required
  if AEntry.StationID.Trim.IsEmpty then
    Errors.Add('Station ID is required');
  
  // Timestamp validation
  if AEntry.Timestamp > Now then
    Errors.Add('Entry date cannot be in the future');
  
  // Temperature range (-100 to +100°C)
  if (AEntry.Temperature < -100) or (AEntry.Temperature > 100) then
    Errors.Add('Temperature must be between -100°C and 100°C');
  
  // Humidity range (0-100%)
  if (AEntry.Humidity < 0) or (AEntry.Humidity > 100) then
    Errors.Add('Humidity must be between 0% and 100%');
  
  // Pressure range (800-1200 hPa)
  if (AEntry.Pressure < 800) or (AEntry.Pressure > 1200) then
    Errors.Add('Pressure must be between 800 hPa and 1200 hPa');
  
  // Wind speed (0-500 km/h)
  if (AEntry.WindSpeed < 0) or (AEntry.WindSpeed > 500) then
    Errors.Add('Wind speed must be between 0 and 500 km/h');
  
  // Wind gust must be >= wind speed
  if AEntry.WindGust < AEntry.WindSpeed then
    Errors.Add('Wind gust cannot be less than wind speed');
  
  // Precipitations (0-500 mm)
  if (AEntry.Precipitations < 0) or (AEntry.Precipitations > 500) then
    Errors.Add('Precipitations must be between 0 and 500 mm');
  
  // Snow depth (0-1000 cm)
  if (AEntry.Snow < 0) or (AEntry.Snow > 1000) then
    Errors.Add('Snow depth must be between 0 and 1000 cm');
  
  Result := Errors.Count = 0;
end;

function TWeatherEntryService.CanDeleteEntry(const AID: string; out Reason: string): Boolean;
begin
  Result := True;
  Reason := '';
  
  // Currently no restrictions on deleting entries
  // Could add business rules like:
  // - Cannot delete entries older than X days
  // - Cannot delete entries marked as "validated"
end;

end.