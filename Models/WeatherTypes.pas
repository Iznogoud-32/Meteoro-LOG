unit WeatherTypes;

interface

uses
  System.SysUtils, System.Generics.Collections, System.Classes;

type
  // Types énumérés
  TStationType = (stAutomatic, stManual, stHybrid, stResearch, stAgricultural);
  TStationStatus = (ssActive, ssMaintenance, ssInactive, ssError, ssTesting);
  TSensorType = (stTemperature, stHumidity, stPressure, stWindSpeed, stWindDirection,
                 stPrecipitation, stSolarRadiation, stSoilTemperature, stSoilMoisture);

  // Record pour les coordonnées
  TCoordinates = record
    Latitude: Double;
    Longitude: Double;
    class function Create(ALat, ALon: Double): TCoordinates; static;
  end;

  // Record pour un capteur
  TSensor = class
  private
    FID: string;
    FName: string;
    FSerialNumber: string;
    FSensorType: TSensorType;
    FUnit: string;
    FIsActive: Boolean;
    FInstallationDate: TDateTime;
    FLastMaintenance: TDateTime;
    FLastCalibration: TDateTime;
    FAccuracy: Double;
  public
    constructor Create(const AID, AName, AUnit, ASerialNumber: string; ASensorType: TSensorType;
                      AIsActive: Boolean; ALastCalibration: TDateTime;
                      AAccuracy: Double);

    property ID: string read FID write FID;
    property Name: string read FName write FName;
    property SerialNumber: string read FSerialNumber write FSerialNumber;
    property SensorType: TSensorType read FSensorType write FSensorType;
    property &Unit: string read FUnit write FUnit;
    property IsActive: Boolean read FIsActive write FIsActive;
    property InstallationDate: TDateTime read FInstallationDate write FInstallationDate;
    property LastMaintenance: TDateTime read FLastMaintenance write FLastMaintenance;
    property LastCalibration: TDateTime read FLastCalibration write FLastCalibration;
    property Accuracy: Double read FAccuracy write FAccuracy;
  end;

  TWeatherStationSensorList = class(TObjectList<TSensor>)
  public
    constructor Create;
  end;

  // Weather station class
  TWeatherStation = class
  private
    FID: string;
    FName: string;
    FCoordinates: TCoordinates;
    FStationType: TStationType;
    FStatus: TStationStatus;
    FSensors: TWeatherStationSensorList;
    FPhoto: string;
    FDescription: string;
    FInstallationDate: TDateTime;
    FLastMaintenance: TDateTime;
    FNextMaintenance: TDateTime;
    FAddress: string;
    FAltitude: Integer;
  public
    constructor Create(const AID, AName, AAddress, ADescription, APhoto: string;
                      ACoordinates: TCoordinates; AStationType: TStationType;
                      AStatus: TStationStatus; AInstallationDate, ALastMaintenance,
                      ANextMaintenance: TDateTime; AAltitude: Integer);
    destructor Destroy; override;
    function Clone: TWeatherStation;

    property ID: string read FID write FID;
    property Name: string read FName write FName;
    property Coordinates: TCoordinates read FCoordinates write FCoordinates;
    property StationType: TStationType read FStationType write FStationType;
    property Status: TStationStatus read FStatus write FStatus;
    property Sensors: TWeatherStationSensorList read FSensors write FSensors;
    property Photo: string read FPhoto write FPhoto;
    property Description: string read FDescription write FDescription;
    property InstallationDate: TDateTime read FInstallationDate write FInstallationDate;
    property LastMaintenance: TDateTime read FLastMaintenance write FLastMaintenance;
    property NextMaintenance: TDateTime read FNextMaintenance write FNextMaintenance;
    property Address: string read FAddress write FAddress;
    property Altitude: Integer read FAltitude write FAltitude;
  end;

  TWeatherStationList = class(TObjectList<TWeatherStation>)
  public
    constructor Create;
  end;

  // Weather entry class
  TWeatherEntry = class
  private
    FID: string;
    FStationID: string;
    FTimestamp: TDateTime;
    FTemperature: Double;
    FHumidity: Double;
    FPressure: Double;
    FWindSpeed: Double;
    FWindGust: Double;
    FWindDirection: string;
    FConditions: string;
    FIConditions: Integer;
    FPrecipitations: Double;
    FSnow: Double;
    FNotes: string;
    FPhoto : string;
    FCreatedAt: TDateTime;
    FUpdatedAt: TDateTime;
  public
    constructor Create(const AStationID: string; ATemperature,
                        AHumidity, APressure, AWindSpeed, APrecipitations, ASnow: Double;
                        const AWindDirection, AConditions, ANotes: string);

    property ID: string read FID write FID;
    property StationID: string read FStationID write FStationID;
    property Timestamp: TDateTime read FTimestamp write FTimestamp;
    property Temperature: Double read FTemperature write FTemperature;
    property Humidity: Double read FHumidity write FHumidity;
    property Pressure: Double read FPressure write FPressure;
    property WindSpeed: Double read FWindSpeed write FWindSpeed;
    property WindGust: Double read FWindGust write FWindGust;
    property WindDirection: string read FWindDirection write FWindDirection;
    property Conditions: string read FConditions write FConditions;
    property IConditions: Integer read FIConditions write FIConditions;
    property Precipitations: Double read FPrecipitations write FPrecipitations;
    property Snow: Double read FSnow write FSnow;
    property Notes: string read FNotes write FNotes;
    property Photo : string read FPhoto write FPhoto;
    property CreatedAt: TDateTime read FCreatedAt write FCreatedAt;
    property UpdatedAt: TDateTime read FUpdatedAt write FUpdatedAt;
  end;

  TWeatherEntryList = class(TObjectList<TWeatherEntry>)
  public
    constructor Create;
  end;

  // Statistics records
  TWeatherStatistics = record
    TotalEntries: Integer;
    TotalStations: Integer;
    ActiveStations: Integer;
    LastEntryDate: TDateTime;
    AverageTemperature: Double;
    AverageHumidity: Double;
    AveragePressure: Double;
    AverageWindSpeed: Double;
  end;

  TStationStatistics = record
    StationID: string;
    StationName: string;
    EntryCount: Integer;
    FirstEntry: TDateTime;
    LastEntry: TDateTime;
    AverageTemperature: Double;
    MinTemperature: Double;
    MaxTemperature: Double;
    AverageHumidity: Double;
    AveragePressure: Double;
    AverageWindSpeed: Double;
    MaxWindSpeed: Double;
    MostCommonCondition: string;
  end;

  // Notification settings
  TNotificationSettings = record
    Enabled: Boolean;
    Temperature: Boolean;
    TemperatureThreshold: Double;
    Humidity: Boolean;
    HumidityThreshold: Double;
    Pressure: Boolean;
    PressureThreshold: Double;
    WindSpeed: Boolean;
    WindSpeedThreshold: Double;
    
    class function Default: TNotificationSettings; static;
  end;

  // Sync settings
  TSyncSettings = record
    Enabled: Boolean;
    Interval: Integer; // minutes
    AutoImportOpenWeather: Boolean;
    ConflictResolution: string; // 'local', 'remote', 'merge'
    LastSync: Double; // TDateTime as Double
    
    class function Default: TSyncSettings; static;
  end;

  // Application settings
  TAppSettings = record
    Theme: string;
    Language: string;
    AutoBackup: Boolean;
    BackupInterval: Integer; // hours
    NotificationSettings: TNotificationSettings;
    SyncSettings: TSyncSettings;
    
    class function Default: TAppSettings; static;
  end;

  // OpenWeather API data structures
  TOpenWeatherData = record
    Temperature: Double;
    FeelsLike: Double;
    Humidity: Double;
    Pressure: Double;
    WindSpeed: Double;
    WindDirection: Double;
    Conditions: string;
    Description: string;
    Visibility: Double;
    UVIndex: Double;
    CloudCover: Double;
    Timestamp: TDateTime;
    
    class function Empty: TOpenWeatherData; static;
  end;

  TOpenWeatherLocation = record
    CityName: string;
    CountryCode: string;
    Latitude: Double;
    Longitude: Double;
    
    class function Create(const ACityName, ACountryCode: string; 
                         ALat, ALon: Double): TOpenWeatherLocation; static;
  end;

  // OpenWeather API Response structures
  TOpenWeatherCoord = record
    Latitude: Double;
    Longitude: Double;
  end;

  TOpenWeatherMain = record
    Temp: Double;
    FeelsLike: Double;
    TempMin: Double;
    TempMax: Double;
    Pressure: Integer;
    Humidity: Integer;
    SeaLevel: Integer;
    GrndLevel: Integer;
  end;

  TOpenWeatherWind = record
    Speed: Double;
    Deg: Integer;
    Gust: Double;
  end;

  TOpenWeatherClouds = record
    All: Integer;
  end;

  TOpenWeatherWeatherItem = record
    ID: Integer;
    Main: string;
    Description: string;
    Icon: string;
  end;

  TOpenWeatherSys = record
    &Type: Integer;
    ID: Integer;
    Country: string;
    Sunrise: Int64;
    Sunset: Int64;
  end;

  TOpenWeatherResponse = record
    Coord: TOpenWeatherCoord;
    Weather: array of TOpenWeatherWeatherItem;
    Base: string;
    Main: TOpenWeatherMain;
    Visibility: Integer;
    Wind: TOpenWeatherWind;
    Clouds: TOpenWeatherClouds;
    Dt: Int64;
    Sys: TOpenWeatherSys;
    Timezone: Integer;
    ID: Integer;
    Name: string;
    Cod: Integer;
    
    // Helper methods
    function ToWeatherEntry(const StationID: string): TWeatherEntry;
    function GetWindDirectionString: string;
    function GetConditionString: string;
    class function Empty: TOpenWeatherResponse; static;
  end;

  // Classes helper pour la conversion
  TStationTypeHelper = record helper for TStationType
    function ToString: string;
    class function FromString(const AValue: string): TStationType; static;
  end;

  TStationStatusHelper = record helper for TStationStatus
    function ToString: string;
    class function FromString(const AValue: string): TStationStatus; static;
  end;

  TSensorTypeHelper = record helper for TSensorType
    function ToString: string;
    function GetDefaultUnit: string;
    class function FromString(const AValue: string): TSensorType; static;
  end;

  function GenerateGUID: string;

implementation

uses
  DateUtils, DatabaseManager;

{ TCoordinates }

class function TCoordinates.Create(ALat, ALon: Double): TCoordinates;
begin
  Result.Latitude := ALat;
  Result.Longitude := ALon;
end;

{ TSensor }

constructor TSensor.Create(const AID, AName, AUnit, ASerialNumber: string; ASensorType: TSensorType;
                      AIsActive: Boolean; ALastCalibration: TDateTime;
                      AAccuracy: Double);
begin
  ID := AID;
  Name := AName;
  &Unit := AUnit;
  SerialNumber := GenerateGUID;
  SensorType := ASensorType;
  IsActive := AIsActive;
  LastCalibration := ALastCalibration;
  Accuracy := AAccuracy;
end;

constructor TWeatherStationSensorList.Create;
begin
  inherited Create(True); // OwnsObjects = True
end;

{ TWeatherStation }

constructor TWeatherStation.Create(const AID, AName, AAddress, ADescription, APhoto: string;
  ACoordinates: TCoordinates; AStationType: TStationType; AStatus: TStationStatus;
  AInstallationDate, ALastMaintenance, ANextMaintenance: TDateTime; AAltitude: Integer);
begin
  ID := AID;
  Name := AName;
  Address := AAddress;
  Description := ADescription;
  Photo := APhoto;
  Coordinates := ACoordinates;
  StationType := AStationType;
  Status := AStatus;
  InstallationDate := AInstallationDate;
  LastMaintenance := ALastMaintenance;
  NextMaintenance := ANextMaintenance;
  Altitude := AAltitude;
  Sensors := TWeatherStationSensorList.Create;
end;

destructor TWeatherStation.Destroy;
begin
  Sensors.Free;
  inherited Destroy;
end;

function TWeatherStation.Clone: TWeatherStation;
var
  I: Integer;
  NewSensor: TSensor;
begin
  Result := TWeatherStation.Create(Self.FID, Self.FName, Self.Address, Self.Description,
                              Self.Photo, Self.Coordinates, Self.StationType, Self.Status,
                              Self.InstallationDate, Self.LastMaintenance, Self.NextMaintenance,
                              Self.Altitude);
  try
    for I := 0 to FSensors.Count - 1 do
    begin
      NewSensor := TSensor.Create(FSensors[I].ID, FSensors[I].Name, FSensors[I].&Unit,
                               FSensors[I].SerialNumber,  FSensors[I].SensorType,
                               FSensors[I].IsActive,  FSensors[I].LastCalibration,
                               FSensors[I].Accuracy);
      Result.Sensors.Add(NewSensor);
    end;
  except
    Result.Free;
    raise;
  end;
end;

constructor TWeatherStationList.Create;
begin
  inherited Create(True); // OwnsObjects = True
end;

{ TWeatherEntry }

constructor TWeatherEntry.Create(const AStationID: string; ATemperature,
  AHumidity, APressure, AWindSpeed, APrecipitations, ASnow: Double;
  const AWindDirection, AConditions, ANotes: string);
begin
  ID := GenerateGUID;
  StationID := AStationID;
  Timestamp := Now;
  Temperature := ATemperature;
  Humidity := AHumidity;
  Pressure := APressure;
  WindSpeed := AWindSpeed;
  WindGust := 0;
  WindDirection := AWindDirection;
  Precipitations := APrecipitations;
  Snow := ASnow;
  Photo := '';
  Conditions := AConditions;
  Notes := ANotes;
  CreatedAt := Now;
  UpdatedAt := Now;
end;

constructor TWeatherEntryList.Create;
begin
  inherited Create(True); // OwnsObjects = True
end;

{ TNotificationSettings }

class function TNotificationSettings.Default: TNotificationSettings;
begin
  Result.Enabled := True;
  Result.Temperature := True;
  Result.TemperatureThreshold := 35.0;
  Result.Humidity := True;
  Result.HumidityThreshold := 80.0;
  Result.Pressure := True;
  Result.PressureThreshold := 1050.0;
  Result.WindSpeed := True;
  Result.WindSpeedThreshold := 50.0;
end;

{ TSyncSettings }

class function TSyncSettings.Default: TSyncSettings;
begin
  Result.Enabled := False;
  Result.Interval := 60;
  Result.AutoImportOpenWeather := False;
  Result.ConflictResolution := 'local';
  Result.LastSync := 0;
end;

{ TAppSettings }

class function TAppSettings.Default: TAppSettings;
begin
  Result.Theme := 'system';
  Result.Language := 'en';
  Result.AutoBackup := True;
  Result.BackupInterval := 24;
  Result.NotificationSettings := TNotificationSettings.Default;
  Result.SyncSettings := TSyncSettings.Default;
end;

{ TOpenWeatherData }

class function TOpenWeatherData.Empty: TOpenWeatherData;
begin
  FillChar(Result, SizeOf(Result), 0);
  Result.Timestamp := 0;
end;

{ TOpenWeatherLocation }

class function TOpenWeatherLocation.Create(const ACityName, ACountryCode: string; 
  ALat, ALon: Double): TOpenWeatherLocation;
begin
  Result.CityName := ACityName;
  Result.CountryCode := ACountryCode;
  Result.Latitude := ALat;
  Result.Longitude := ALon;
end;

{ TOpenWeatherResponse }

function TOpenWeatherResponse.ToWeatherEntry(const StationID: string): TWeatherEntry;
var
  Description: string;
begin
//  // Get description from weather array
//  if Length(Weather) > 0 then
//    Description := Weather[0].Description
//  else
//    Description := 'No description';
//
//  Result := TWeatherEntry.Create(
//    StationID,
//    Main.Temp,
//    Main.Humidity,
//    Main.Pressure,
//    Wind.Speed * 3.6, // Convert m/s to km/h
//    GetWindDirectionString,
//    GetConditionString,
//    Format('OpenWeather import: %s', [Description])
//  );
//
//  Result.WindGust := Wind.Gust * 3.6; // Convert m/s to km/h
//  Result.Timestamp := UnixToDateTime(Dt);
end;

function TOpenWeatherResponse.GetWindDirectionString: string;
const
  Directions: array[0..15] of string = (
    'N', 'NNE', 'NE', 'ENE', 'E', 'ESE', 'SE', 'SSE',
    'S', 'SSW', 'SW', 'WSW', 'W', 'WNW', 'NW', 'NNW'
  );
var
  Index: Integer;
begin
  Index := Round(Wind.Deg / 22.5) mod 16;
  Result := Directions[Index];
end;

function TOpenWeatherResponse.GetConditionString: string;
begin
  if Length(Weather) > 0 then
  begin
    // Map OpenWeather condition codes to our condition strings
    case Weather[0].ID of
      200..299: Result := 'thunderstorm';
      300..399: Result := 'drizzle';
      500..599: Result := 'rain';
      600..699: Result := 'snow';
      700..799: Result := 'fog';
      800: Result := 'clear';
      801..899: Result := 'cloudy';
      else Result := 'clear';
    end;
  end
  else
    Result := 'clear';
end;

class function TOpenWeatherResponse.Empty: TOpenWeatherResponse;
begin
  FillChar(Result, SizeOf(Result), 0);
  SetLength(Result.Weather, 0);
end;

function GenerateGUID: string;
var
  GUID: TGUID;
begin
  CreateGUID(GUID);
  Result := GUIDToString(GUID);
  // Remove curly braces
  Result := Copy(Result, 2, Length(Result) - 2);
end;

{ TStationTypeHelper }

function TStationTypeHelper.ToString: string;
begin
  case Self of
    stAutomatic: Result := 'Automatique';
    stManual: Result := 'Manuelle';
    stHybrid: Result := 'Hybride';
    stResearch: Result := 'Recherche';
    stAgricultural: Result := 'Agricole';
  end;
end;

class function TStationTypeHelper.FromString(const AValue: string): TStationType;
begin
  if AValue = 'Automatique' then Result := stAutomatic
  else if AValue = 'Manuelle' then Result := stManual
  else if AValue = 'Hybride' then Result := stHybrid
  else if AValue = 'Recherche' then Result := stResearch
  else if AValue = 'Agricole' then Result := stAgricultural
  else Result := stAutomatic;
end;

{ TStationStatusHelper }

function TStationStatusHelper.ToString: string;
begin
  case Self of
    ssActive: Result := 'Active';
    ssMaintenance: Result := 'Maintenance';
    ssInactive: Result := 'Inactive';
    ssError: Result := 'Erreur';
    ssTesting: Result := 'Test';
  end;
end;

class function TStationStatusHelper.FromString(const AValue: string): TStationStatus;
begin
  if AValue = 'Active' then Result := ssActive
  else if AValue = 'Maintenance' then Result := ssMaintenance
  else if AValue = 'Inactive' then Result := ssInactive
  else if AValue = 'Erreur' then Result := ssError
  else if AValue = 'Test' then Result := ssTesting
  else Result := ssActive;
end;

{ TSensorTypeHelper }

function TSensorTypeHelper.ToString: string;
begin
  case Self of
    stTemperature: Result := 'Température';
    stHumidity: Result := 'Humidité';
    stPressure: Result := 'Pression';
    stWindSpeed: Result := 'Vitesse du vent';
    stWindDirection: Result := 'Direction du vent';
    stPrecipitation: Result := 'Précipitations';
    stSolarRadiation: Result := 'Rayonnement solaire';
    stSoilTemperature: Result := 'Température du sol';
    stSoilMoisture: Result := 'Humidité du sol';
  end;
end;

function TSensorTypeHelper.GetDefaultUnit: string;
begin
  case Self of
    stTemperature, stSoilTemperature: Result := '°C';
    stHumidity, stSoilMoisture: Result := '%';
    stPressure: Result := 'hPa';
    stWindSpeed: Result := 'm/s';
    stWindDirection: Result := '°';
    stPrecipitation: Result := 'mm';
    stSolarRadiation: Result := 'W/m²';
  else
    Result := '';
  end;
end;

class function TSensorTypeHelper.FromString(const AValue: string): TSensorType;
begin
  if AValue = 'Température' then Result := stTemperature
  else if AValue = 'Humidité' then Result := stHumidity
  else if AValue = 'Pression' then Result := stPressure
  else if AValue = 'Vitesse du vent' then Result := stWindSpeed
  else if AValue = 'Direction du vent' then Result := stWindDirection
  else if AValue = 'Précipitations' then Result := stPrecipitation
  else if AValue = 'Rayonnement solaire' then Result := stSolarRadiation
  else if AValue = 'Température du sol' then Result := stSoilTemperature
  else if AValue = 'Humidité du sol' then Result := stSoilMoisture
  else Result := stTemperature;
end;

end.