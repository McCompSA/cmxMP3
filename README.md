# cmxMP3
Repository for Clark's Tisdale class for playing mp3 files http://clarktisdale.com/d-mp3.php

## Original description


This is a Delphi class for playing .mp3 files. It plays .mp3 files using the mciSendCommand API which is a standard part of Windows. In fact, it is the same API that CDmax uses to play audio CDs, but this class uses a different command set.

The class descends from TObject and represents a single .mp3 file. So you can create as many as you like depending on your needs. You pass the .mp3 file path as a parameter in the constructor.

Once an object is created from the class you can play, pause, resume, and stop the file.

Progress and completion events can be set allowing you to receive notifications of where things are during the play process.

A v1.1 ID3 record can be read and written using properties and methods provided in the class. So the .mp3 file itself can store text information about the title, artist, genre, etc. as well as the music data.

The class unit is provided in a .zip file along with a sample application project which shows many of the functions of the class. The link to the file is at the top of this page.

The sample application compiles with Delphi 5 and 6 as given. It should compile in other versions with only minor modification.

The class and sample application are given as example code. Feel free to use it, and learn from it. Contact me via email if you have questions or comments.

This is the public interface of the class:

### Constructor
```delphi
{ create an object for a specific .mp3 file }
constructor Create(const aFilePath : string);
```
### Methods
```delphi
{ player methods }
procedure Play;  
procedure Stop;  
procedure Pause;  
procedure Resume;

{ change ID3 record }
procedure ChgID3(const aTitle, aArtist, aAlbum, aComment: string; aYear: integer; aTrack, aGenre: byte);

{ change .mp3 file path }
function ChgFilePath(const aFilePath, aFileName: string): boolean;

{ returns the largest GenreID value }
function MaxGenreID : integer;
```

### Properties
```delphi
{ returns genre text given a valid index }
property GenreText[aNdx : integer] : string

{ length of .mp3 in seconds }
property LengthInSeconds : integer

{ state of player }
property State : TMPMode

{ ID3 values }
property Title : string  
property Artist : string  
property Album : string  
property Comment : string  
property Year : string  
property Track : byte  
property GenreNdx : byte

{ .mp3 file name }
property FileName : string

{ .mp3 file path }
property FilePath : string
```
### Events
```delphi
{ fires at the end of play }
property OnPlayComplete : TNotifyEvent

{ fires once per second as play progresses }  
property OnPlayProgress : TcmxPlayProgress
```

