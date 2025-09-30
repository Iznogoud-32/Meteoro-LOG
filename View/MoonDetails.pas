unit MoonDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, moon;

type
  TMoonForm = class(TForm)
    lbl_local: TLabel;
    val_local: TLabel;
    lbl_age: TLabel;
    val_age: TLabel;
    lbl_phase: TLabel;
    val_phase: TLabel;
    val_moon_phase: TLabel;
    BtnFermer: TButton;
    GroupBoxCycle: TGroupBox;
    lbl_lastnew: TLabel;
    val_newmoon: TLabel;
    lbl_firstquart: TLabel;
    lbl_full: TLabel;
    lbl_lastquart: TLabel;
    lbl_nextnew: TLabel;
    val_firstquart: TLabel;
    val_full: TLabel;
    val_lastquart: TLabel;
    val_nextnew: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
    last_phase_value: integer;
  public
    { Déclarations publiques }
  end;

implementation

{$R *.dfm}

Uses
  Main, Almanac, DateUtils;

// Calcul de la phase de la lune (croissante ou décroissante)
function calc_phase(x:TDateTime):string;
begin
   // Comparaison des phases aux jours x et x+1
   if (round(current_phase(x)*100) < (round(current_phase(x+1)*100))) then
      result:='Croissante'
   else result:='Décroissante';
end;

procedure TMoonForm.FormCreate(Sender: TObject);
begin
  last_phase_value:=199;
end;

procedure TMoonForm.FormShow(Sender: TObject);
var
  temp: TDateTime;
  age: extended;
  s:string;
  h,m,sec,ms: word;
  new_phase: integer;
begin
  Val_Local.Caption:=DatetoStr(now);
  temp:=last_phase(now,Newmoon);
  val_newmoon.caption:=datestring(temp);
  val_firstquart.caption:=datestring(next_phase(temp,FirstQuarter));
  val_full.caption:=datestring(next_phase(temp,FullMoon));
  val_lastquart.caption:=datestring(next_phase(temp,LastQuarter));
  val_nextnew.caption:=DatetoStr(next_phase(now,NewMoon));

  age:=ageofmoon(now);
  decodetime(age,h,m,sec,ms);
  s:=inttostr(trunc(age))+' jours';
  val_age.caption:=s;
  new_phase:=round(current_phase(today)*100);
  val_phase.caption:=inttostr(new_phase)+'%';
  if (new_phase=0) then val_moon_phase.caption:='Nouvelle lune'
  else if (new_phase=100) then val_moon_phase.caption:='Pleine lune'
  else val_moon_phase.caption:=calc_phase(today);
end;

end.
