
\score
{
<<
  \new ChordNames {
    \germanChords % http://lilypond.org/doc/v2.19/Documentation/notation/displaying-chords#customizing-chord-names
    \chordmode {

      %a4:m a4:m a4:m a4:m 
      
      % вступительный марш
      a1:m a:m a:m a:m e:7 a:m

      % segno (1)
      % [|:
      %\skip1
      a:m e:7 a:7 d:m g:7 c f

      % --- volta 1
      b2:7 e2:7  | d2.:m g4 | c2 b2:7 | d2.:m e4 | a1:m
      % :|]
      % --- volta 2
      b2:7 e2:7  | a1 d:m g c  f2 d2:m g2 c:7 d1:m

      % coda from: 
      b2:7 e2:7 |  a1:7  | d2:m a2:m | d2.:m a4:m | e2:7 a2:m

      \skip1
      % coda to:
      b2:7  e2:7 | f2 d2:m | g2:7 c2 | d1:m | b2:7  e2:5+ | a2:m f2:7  | e1:5+  

      a2:m f2:7 | b1:7 | b2:7 e2 | a4:m 
    }
  }

  %\new Voice \with {
    %\consists "Pitch_squash_engraver"
  %}

  \relative c'
  {
    \key ees \major
    \time 4/4
    %\tempo 4 = 128
    \compressFullBarRests
    \override MultiMeasureRest.expand-limit = #3
    \override Staff.StaffSymbol.color = #(x11-color 'SlateBlue2)
    \numericTimeSignature % писать 4/4 цифрами, а не литерой "С"
    \improvisationOn

    %\repeat percent 3 {
      a'8 r a8 r a8 r \tuplet 3/2 {a a a} | \tuplet 3/2 {a a a} \tuplet 3/2 {a a a}  a4 r 
      a8 r a8 r a8 r \tuplet 3/2 {a a a} | \tuplet 3/2 {a a a} \tuplet 3/2 {a a a}  a4 r 
      a8 r a8 r a8 r \tuplet 3/2 {a a a} | \tuplet 3/2 {a a a} \tuplet 3/2 {a a a}  a4 r 
    %}

    %\break
    \mark \markup { \musicglyph #"scripts.segno" } 

    % \skip1
    % \once \override Score.RehearsalMark.font-size = #-2
    % \mark \markup { \circle 1 }

    %\bar "[|:"
    \repeat volta 2
    {
      \repeat percent 7 { a8[a a a] a8[a a a] }
    }
    \alternative 
    {
      {
        a8[a a a] a8[a a a]

           a8 r a8 r a8 r \tuplet 3/2 {a a a} | \tuplet 3/2 {a a a} \tuplet 3/2 {a a a}  a4 r 
           a8 r a8 r a8 r \tuplet 3/2 {a a a} | \tuplet 3/2 {a a a} \tuplet 3/2 {a a a}  a4 r 
      }
      {
        %break
        a8[a a a] a8[a a a]
      }
    }
  

    
    % \once \override Score.RehearsalMark.font-size = #-2
    % \mark \markup { \circle 2 }


    % --- volta 2
    \repeat percent 7 
    {
      %
      % TODO переделать ритм на: r4 a4 \tuplet 3/2 {r8 a a} \tuplet 3/2 {a8 a a}
      %
      \tuplet 3/2 {a a a} \tuplet 3/2 {a a a} \tuplet 3/2 {a a a} \tuplet 3/2 {a a a} 
    }

    \once \override Score.RehearsalMark.font-size = #5
    \mark \markup { \musicglyph #"scripts.coda" }

    \tuplet 3/2 {a a a} \tuplet 3/2 {a a a} \tuplet 3/2 {a a a} \tuplet 3/2 {a a a}


    a8 r a8 r a8 r \tuplet 3/2 {a a a} | \tuplet 3/2 {a a a} \tuplet 3/2 {a a a}  a4 r 
    a8 r a8 r a8 r \tuplet 3/2 {a a a} | \tuplet 3/2 {a a a} \tuplet 3/2 {a a a}  a4 r 
    
    \mark \markup { \musicglyph #"scripts.segno" } \bar "||" 
    
    \skip1

    \once \override Score.RehearsalMark.font-size = #5
    \mark \markup { \musicglyph #"scripts.coda" }

    
    \repeat percent 6 
    {
      %
      % TODO переделать ритм на: r4 a4 \tuplet 3/2 {r8 a a} \tuplet 3/2 {a8 a a}
      %
      \tuplet 3/2 {a8 a a} \tuplet 3/2 {a a a} \tuplet 3/2 {a a a} \tuplet 3/2 {a a a} 
    }
  
    %\break

    a8 r a8 r a8 r \tuplet 3/2 {a a a} | \tuplet 3/2 {a a a} \tuplet 3/2 {a a a}  a4 r 
    a8 r a8 r a8 r \tuplet 3/2 {a a a} | \tuplet 3/2 {a a a} \tuplet 3/2 {a a a}  a4 r 
    a4 r r r

    \bar "|." 
  }
>>
}
\layout {
    #(layout-set-staff-size 14)
    %#(set-default-paper-size "a6" 'landscape)
    indent = #0
    %line-width = #180
    ragged-last = ##f
    ragged-right = ##f
  }


\header {
    title = "Расскажи мне отец"
    subtitle = ""
    instrument = \markup \with-color #grey "Guitar"
    poet = ""
    piece = ""
    opus = ""
    arranger = ""
    copyright = "CC BY-NC-SA. 2018"
    tagline = ""
}

\paper {
  system-system-spacing = #'((basic-distance . 0.1) (padding . 5))
  ragged-last-bottom = ##f
  %ragged-bottom = ##f
}

\version "2.18.2"

