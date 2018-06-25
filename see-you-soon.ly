\version "2.18.2"

\header {
  title = "До скорой встречи"
}

global = {
  \time 4/4
  \compressFullBarRests
  \improvisationOn
}

chordNames = \chordmode {
  \global
  \germanChords
  
  aes1 f:min bes ees aes f:min g g
  
  f:m g c:m c:m f:m bes ees c f:m g c:m aes f:m aes g g
  
  aes f:min bes ees aes f:m g g
  
  aes f:min bes ees aes f:m g g
}

melody = \relative c'' {
  \global
  \key aes \major
  
  a1 a1 a1 a1 a1 a1 a1 a1 % \repeat percent 7 { a1 } 
  \break
  
  \mark \markup { \musicglyph #"scripts.segno" \circle 1 \circle 3  \circle 6 } 
  %\mark \markup { \musicglyph #"scripts.segno"  } 
  %\bar "[|:"
  

  
  %\mark \markup { \circle 2 \circle 4 \circle 5 }
  
  \repeat volta 6
  {
      \repeat percent 8 { a8[a a a] a8[a a a] }
      \break
      \repeat percent 8 { a8[a a a] a8[a a a] }
      \break
      \bar "[|:"
    %\repeat percent 8 { a8[a a a] a8[a a a] }
    %\bar ":|]"
    %\mark \markup { \circle 3 }
    
    \break
  }
  \alternative 
  {    
    { \repeat percent 8 { a8[a a a] a8[a a a] } }
    {
      \mark \markup { \circle 3 }
      \repeat percent 8 { a8[a a a] a8[a a a] } 
    }
  }

  \mark \markup { \musicglyph #"scripts.segno" } 
  \bar ":|]"
}

\score {
  <<
    \new ChordNames \chordNames
    %\new FretBoards \chordNames
    \new Staff { \melody }
    %\addlyrics { \words }
  >>
  \layout { }
  %\midi { }
}
