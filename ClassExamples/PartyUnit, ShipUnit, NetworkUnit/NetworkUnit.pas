unit NetworkUnit;

interface

type
  MessageBuf = record
  	cmdIndex : byte;		
  end;	

  ShipLocationsBuf = record 
  	cmdIndex : byte;
  	ShipsArray : array[1..2, 1..10] of Byte*;
  end;

  ShotLoactionBuf = record
    cmdIndex : byte;
    X, Y : byte;
  end;  

  TNet = class
    private

    public
  	  procedure sendStartShipSettings;
  	  procedure sendShipLocations;
  	  procedure sendStartGame;
  	  procedure sendGo;
  	  procedure sendShotLocation(X, Y : byte);
  	  procedure sendHit;
  	  procedure sendMiss;
  	  procedure sendYouWin;
  end;	 

implementation
	
procedure TNet.sendStartShipSettings;
var Buf : MessageBuf;
begin
	Buf.cmdIndex := 1;
	ServerSocket1.Socket.Connections[].sendBuf(Buf, sizeof(Buf));
end;	

procedure TNet.sendShipLocations;
var Buf : ShipLocationsBuf;
begin
	Buf.cmdIndex := 2;
	Buf.ShipsArray := Party.getShipsArray;
	ClientSocket1.Socket.sendBuf(Buf, sizeof(Buf));
end;

procedure TNet.sendStartGame;
var Buf : MessageBuf; 
begin
  Buf.cmdIndex := 3;
  ClientSocket1.Socket.sendBuf(Buf, sizeof(Buf));
end;

procedure TNet.sendGo;
var Buf : MessageBuf;
begin
  Buf.cmdIndex := 4;
  ClientSocket1.Socket.sendBuf(Buf, sizeof(Buf));
end;

procedure TNet.sendShotLocation(X, Y : byte);
var Buf : ShotLoactionBuf; 
begin
  Buf.cmdIndex := 5;
  Buf.X := X;
  Buf.Y := Y;
  ClientSocket1.Socket.sendBuf(Buf, sizeof(Buf));
end;

procedure TNet.sendHit;
var Buf : MessageBuf;  
begin
  Buf.cmdIndex := 6;
  ClientSocket1.Socket.sendBuf(Buf, sizeof(Buf));
end;

procedure TNet.sendMiss;
var Buf : MessageBuf;  
begin
  Buf.cmdIndex := 7;
  ClientSocket1.Socket.sendBuf(Buf, sizeof(Buf));
end;

procedure TNet.sendYouWin;
var Buf : MessageBuf;  
begin
  Buf.cmdIndex := 8;
  ClientSocket1.Socket.sendBuf(Buf, sizeof(Buf));
end;

end.