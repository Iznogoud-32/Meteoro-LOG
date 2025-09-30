unit SunDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TSunForm = class(TForm)
    lbl_local: TLabel;
    val_local: TLabel;
    GroupBoxSoleil: TGroupBox;
    Lbl_AReel: TLabel;
    Val_AReel: TLabel;
    Lbl_CReel: TLabel;
    Val_CReel: TLabel;
    Val_CCivil: TLabel;
    Lbl_ACivil: TLabel;
    Val_ACivil: TLabel;
    Lbl_CCivil: TLabel;
    Val_CNautique: TLabel;
    Lbl_ANautique: TLabel;
    Val_ANautique: TLabel;
    Lbl_CNautique: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Lbl_AAstro: TLabel;
    Lbl_CAstro: TLabel;
    Val_AAstro: TLabel;
    Val_CAstro: TLabel;
    BtnFermer: TButton;
    procedure FormShow(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

implementation
{$R *.dfm}

uses
  DateUtils, Almanac;

 procedure TSunForm.FormShow(Sender: TObject);
begin
  Val_Local.Caption:=formatdatetime('ddddd',Now);
  Val_AReel.Caption:=formatdatetime('hh:nn',Get_SunTime(Now,46.3,1.433).SAubeReel)+' UTC';
  Val_CReel.Caption:=formatdatetime('hh:nn',Get_SunTime(Now,46.3,1.433).SCrepReel)+' UTC';
  Val_ACivil.Caption:=formatdatetime('hh:nn',Get_SunTime(Now,46.3,1.433).SAubeCivi)+' UTC';
  Val_CCivil.Caption:=formatdatetime('hh:nn',Get_SunTime(Now,46.3,1.433).SCrepCivi)+' UTC';
  Val_ANautique.Caption:=formatdatetime('hh:nn',Get_SunTime(Now,46.3,1.433).SAubeNaut)+' UTC';
  Val_CNautique.Caption:=formatdatetime('hh:nn',Get_SunTime(Now,46.3,1.433).SCrepNaut)+' UTC';
  Val_AAstro.Caption:=formatdatetime('hh:nn',Get_SunTime(Now,46.3,1.433).SAubeAstr)+' UTC';
  Val_CAstro.Caption:=formatdatetime('hh:nn',Get_SunTime(Now,46.3,1.433).SCrepAstr)+' UTC';
end;

end.
