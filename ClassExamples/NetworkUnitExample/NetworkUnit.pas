unit NetworkUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ScktComp;

type
  TForm1 = class(TForm)
    ServerSocket1: TServerSocket;
    ClientSocket1: TClientSocket;
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TSArr = array[1..2, 1..20] of Byte;

  MessageBuf = record
  	cmdIndex : byte;
  end;

  ShipLocationsBuf = record
  	cmdIndex : byte;
  	ShipsArray : TSArr;
  end;

  ShotLoactionBuf = record
    cmdIndex : byte;
    X, Y : byte;
  end;

  ReadBuf = array[1..41] of byte;

  TNet = class
    private

    public
      constructor Create;
      destructor Destroy; override;
      procedure startServerSocket(Port: integer);
      procedure startClientSocket(Port : integer; Address : String);
  	  procedure sendStartShipSettings(ConNumber : integer);
  	  procedure sendShipLocations(ShipsArray : TSArr);
  	  procedure sendStartGame;
  	  procedure sendGo(ConNumber : integer);
  	  procedure sendShotLocation(X, Y : byte);
  	  procedure sendHit(ConNumber : integer);
  	  procedure sendMiss(ConNumber : integer);
  	  procedure sendYouWin(ConNumber : integer);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TNet.sendStartShipSettings(ConNumber : integer);
var Buf : MessageBuf;
begin
	Buf.cmdIndex := 1;
	Form1.ServerSocket1.Socket.Connections[ConNumber].sendBuf(Buf, sizeof(Buf));
end;	

procedure TNet.sendShipLocations(ShipsArray : TSArr);
var Buf : ShipLocationsBuf;
begin
	Buf.cmdIndex := 2;
	Buf.ShipsArray := ShipsArray;
	Form1.ClientSocket1.Socket.sendBuf(Buf, sizeof(Buf));
end;

procedure TNet.sendStartGame;
var Buf : MessageBuf; 
begin
  Buf.cmdIndex := 3;
  Form1.ClientSocket1.Socket.sendBuf(Buf, sizeof(Buf));
end;

procedure TNet.sendGo(ConNumber : integer);
var Buf : MessageBuf;
begin
  Buf.cmdIndex := 4;
  Form1.ServerSocket1.Socket.Connections[ConNumber].sendBuf(Buf, sizeof(Buf));
end;

procedure TNet.sendShotLocation(X, Y : byte);
var Buf : ShotLoactionBuf; 
begin
  Buf.cmdIndex := 5;
  Buf.X := X;
  Buf.Y := Y;
  Form1.ClientSocket1.Socket.sendBuf(Buf, sizeof(Buf));
end;

procedure TNet.sendHit(ConNumber : integer);
var Buf : MessageBuf;
begin
  Buf.cmdIndex := 6;
  Form1.ServerSocket1.Socket.Connections[ConNumber].SendBuf(Buf, sizeof(Buf));
end;

procedure TNet.sendMiss(ConNumber : integer);
var Buf : MessageBuf;  
begin
  Buf.cmdIndex := 7;
  Form1.ServerSocket1.Socket.Connections[ConNumber].sendBuf(Buf, sizeof(Buf));
end;

procedure TNet.sendYouWin(ConNumber : integer);
var Buf : MessageBuf;  
begin
  Buf.cmdIndex := 8;
  Form1.ServerSocket1.Socket.Connections[ConNumber].sendBuf(Buf, sizeof(Buf));
end;

constructor TNet.Create;
begin

end;

destructor TNet.Destroy;
begin

  inherited;
end;

procedure TNet.startServerSocket(Port: Integer);
begin
  Form1.ServerSocket1.Port := Port;
  Form1.ServerSocket1.Active := true;
  Form1.ServerSocket1.Free;
end;



procedure TNet.startClientSocket(Port: integer; Address: String);
begin
  Form1.ClientSocket1.Port := Port;
  Form1.ClientSocket1.Address := Address;
  Form1.ClientSocket1.Active := true;
end;



procedure TForm1.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var Buf : ReadBuf;
begin
  Socket.ReceiveBuf(Buf, SizeOf(Buf));
  if Buf[1] = 1 then
   begin

   end;
end;

end.
