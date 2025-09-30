unit ValidationService;

interface

uses
  System.SysUtils, System.Classes, System.Generics.Collections;

type
  TValidationResult = record
    IsValid: Boolean;
    Errors: TStringList;
    constructor Create(AIsValid: Boolean);
    procedure AddError(const AError: string);
    function GetErrorMessage: string;
  end;

  TValidationService = class
  public
    // Geographic validations
    class function ValidateLatitude(const AValue: Double; out Error: string): Boolean;
    class function ValidateLongitude(const AValue: Double; out Error: string): Boolean;
    class function ValidateAltitude(const AValue: Integer; out Error: string): Boolean;
    
    // Weather parameter validations
    class function ValidateTemperature(const AValue: Double; out Error: string): Boolean;
    class function ValidateHumidity(const AValue: Double; out Error: string): Boolean;
    class function ValidatePressure(const AValue: Double; out Error: string): Boolean;
    class function ValidateWindSpeed(const AValue: Double; out Error: string): Boolean;
    class function ValidatePrecipitation(const AValue: Double; out Error: string): Boolean;
    
    // Date validations
    class function ValidatePastDate(const ADate: TDateTime; const AFieldName: string; 
      out Error: string): Boolean;
    class function ValidateFutureDate(const ADate: TDateTime; const AFieldName: string; 
      out Error: string): Boolean;
    class function ValidateDateRange(const AStartDate, AEndDate: TDateTime; 
      out Error: string): Boolean;
    
    // String validations
    class function ValidateRequiredString(const AValue, AFieldName: string; 
      out Error: string): Boolean;
    class function ValidateStringLength(const AValue: string; AMinLength, AMaxLength: Integer; 
      const AFieldName: string; out Error: string): Boolean;
  end;

implementation

uses
  DateUtils;

{ TValidationResult }

constructor TValidationResult.Create(AIsValid: Boolean);
begin
  IsValid := AIsValid;
  Errors := TStringList.Create;
end;

procedure TValidationResult.AddError(const AError: string);
begin
  IsValid := False;
  Errors.Add(AError);
end;

function TValidationResult.GetErrorMessage: string;
begin
  Result := Errors.Text;
end;

{ TValidationService }

class function TValidationService.ValidateLatitude(const AValue: Double; 
  out Error: string): Boolean;
begin
  Result := (AValue >= -90) and (AValue <= 90);
  if not Result then
    Error := Format('Latitude must be between -90 and 90 (got %.2f)', [AValue]);
end;

class function TValidationService.ValidateLongitude(const AValue: Double; 
  out Error: string): Boolean;
begin
  Result := (AValue >= -180) and (AValue <= 180);
  if not Result then
    Error := Format('Longitude must be between -180 and 180 (got %.2f)', [AValue]);
end;

class function TValidationService.ValidateAltitude(const AValue: Integer; 
  out Error: string): Boolean;
begin
  Result := (AValue >= -500) and (AValue <= 9000);
  if not Result then
    Error := Format('Altitude must be between -500m and 9000m (got %d)', [AValue]);
end;

class function TValidationService.ValidateTemperature(const AValue: Double; 
  out Error: string): Boolean;
begin
  Result := (AValue >= -100) and (AValue <= 100);
  if not Result then
    Error := Format('Temperature must be between -100°C and 100°C (got %.1f)', [AValue]);
end;

class function TValidationService.ValidateHumidity(const AValue: Double; 
  out Error: string): Boolean;
begin
  Result := (AValue >= 0) and (AValue <= 100);
  if not Result then
    Error := Format('Humidity must be between 0%% and 100%% (got %.1f)', [AValue]);
end;

class function TValidationService.ValidatePressure(const AValue: Double; 
  out Error: string): Boolean;
begin
  Result := (AValue >= 800) and (AValue <= 1200);
  if not Result then
    Error := Format('Pressure must be between 800 hPa and 1200 hPa (got %.1f)', [AValue]);
end;

class function TValidationService.ValidateWindSpeed(const AValue: Double; 
  out Error: string): Boolean;
begin
  Result := (AValue >= 0) and (AValue <= 500);
  if not Result then
    Error := Format('Wind speed must be between 0 and 500 km/h (got %.1f)', [AValue]);
end;

class function TValidationService.ValidatePrecipitation(const AValue: Double; 
  out Error: string): Boolean;
begin
  Result := (AValue >= 0) and (AValue <= 500);
  if not Result then
    Error := Format('Precipitation must be between 0 and 500 mm (got %.1f)', [AValue]);
end;

class function TValidationService.ValidatePastDate(const ADate: TDateTime; 
  const AFieldName: string; out Error: string): Boolean;
begin
  Result := ADate <= Now;
  if not Result then
    Error := Format('%s cannot be in the future', [AFieldName]);
end;

class function TValidationService.ValidateFutureDate(const ADate: TDateTime; 
  const AFieldName: string; out Error: string): Boolean;
begin
  Result := ADate >= Now;
  if not Result then
    Error := Format('%s cannot be in the past', [AFieldName]);
end;

class function TValidationService.ValidateDateRange(const AStartDate, AEndDate: TDateTime; 
  out Error: string): Boolean;
begin
  Result := AStartDate <= AEndDate;
  if not Result then
    Error := 'Start date must be before or equal to end date';
end;

class function TValidationService.ValidateRequiredString(const AValue, AFieldName: string; 
  out Error: string): Boolean;
begin
  Result := not AValue.Trim.IsEmpty;
  if not Result then
    Error := Format('%s is required', [AFieldName]);
end;

class function TValidationService.ValidateStringLength(const AValue: string; 
  AMinLength, AMaxLength: Integer; const AFieldName: string; out Error: string): Boolean;
var
  Len: Integer;
begin
  Len := Length(AValue.Trim);
  Result := (Len >= AMinLength) and (Len <= AMaxLength);
  if not Result then
    Error := Format('%s must be between %d and %d characters (got %d)', 
      [AFieldName, AMinLength, AMaxLength, Len]);
end;

end.