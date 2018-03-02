\score
{
<<
  \new ChordNames {
    \chordmode {
      
      % segno start
      % 1
      a1:min6 f:6 g:7 c f d:min 

      % 7
      e1:7sus4 e:7 

      R1*6 e1:7sus4 e:7 a1:min 

      % 18
      d1:min7 g:7 c:7 f d:min e1:7sus4 e1:7 % :|| segno end

      % 25
      e1:sus7 e1:7 a1:min
    }
  }

  %\new Voice \with {
    %\consists "Pitch_squash_engraver"
  %}

  \relative c'' 
  {
    \key a \minor
    \time 4/4
    %\tempo 4 = 128
    \compressFullBarRests
    \override MultiMeasureRest.expand-limit = #3
    \numericTimeSignature % писать 4/4 цифрами, а не литерой "С"
    \improvisationOn

    
    %<>\segno % start repeat    
    \mark \markup { \musicglyph #"scripts.segno" }

    \repeat percent 6 { a8[a a a] a8[a a a] } 
    
    %a8[a a a] a8[a a a ]

    %\once \override Staff.KeySignature.break-visibility = #end-of-line-invisible
    %\once \override Staff.Clef.break-visibility = #end-of-line-invisible
    \mark \markup { \musicglyph #"scripts.coda" }

    % Set coda sign as rehearsal mark and adjust size if needed
    \once \override Score.RehearsalMark.break-visibility = #begin-of-line-invisible
    \once \override Score.RehearsalMark.font-size = #5
    \bar "||" \break

    \repeat percent 2{ a8[a a a] a8[a a a] }

    \once \override Score.RehearsalMark.font-size = #-2
    \mark \markup { \circle 1 }
    R1*6
    
    \repeat percent 2 { a8[a a a] a8[a a a] }
        
    \once \override Score.RehearsalMark.font-size = #-2
    \mark \markup { \circle 2 \circle 3 \circle 4 \circle 5 \circle 6 \circle 7  }

    %\once \override Staff.KeySignature.break-visibility = #begin-of-line-invisible
    \bar "[|:" \repeat percent 7 { 
        a8[a a a] a8[a a a] 
    } 
    
    \once \override Score.RehearsalMark.extra-offset = #'( 28 . -2 )
    \mark \markup { \musicglyph #"scripts.segno" }
    
    a8[a a a] a8a a a
    
    \bar ":|]" \break
    
    % s1
    % \stopStaff

    % \startStaff
    % \break
    % \once \override Staff.KeySignature.break-visibility = #begin-of-line-invisible
    % \once \override Staff.Clef.break-visibility = #end-of-line-invisible
    % \once \override Score.RehearsalMark.extra-offset = #'( -1 . .5 )

    \once \override Score.RehearsalMark.font-size = #5
    \mark \markup { \musicglyph #"scripts.coda" }
    a4 a a a4 | a4 r4 a4 r4 | a1
    

   % \repeat volta 6 { \inStaffSegno  a8[a a a] a8[a a a] } \alternative { a4 a a a4 | a4 r4 a4 r4 | a1  }
    
    \bar "|." 
  }
>>
}
\layout {
    %#(layout-set-staff-size 14)
    indent = #0
    %line-width = #150
    ragged-last = ##t
  }


\header {
    title = "I Will Survive"
    subtitle = ""
    instrument = \markup \with-color #grey "Guitar"
    poet = ""
    piece = ""
    opus = ""
    arranger = "Romanenko V.A."
    copyright = "CC BY-NC-SA. 2018"
    tagline = "The song's lyrics was written by Freddie Perren, Dino Fekaris in 1978."
}

\version "2.18.2"

