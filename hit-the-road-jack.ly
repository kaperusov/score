

\score {
<<
  \new ChordNames 
  {
    \chordmode 
    {
      \time 4/4
      % a2:min g | f | e 
      R1*4
      g2:min f ees d 
      g2:min f ees d
      g2:min f ees d
      g2:min f ees d
    }
  }

  \relative c'
  {
    <<
    \new Voice = "one" 
    {
      \voiceOne
      \key a \minor
      \time 2/2
      \tempo "With determination and growl!" 2 = 82
      
      %a'1\rest a1\rest a1\rest
      R1*3 
      r2 a'4\rest e8.[c16] | \break 

      % 5
      \bar "[|:" 
      d8.[( c16 a8.) a16] r4 r8. a16 | c8.[c16 d8.( c16)] d4 c 
      e4 e a a c4 c a e8.[c16] %\break

      % 9
      d8.[( c16 a8.) a16] r4 r8. a16 | c8.[c16 d8.( c16)] d4 a 
      
      %a1( a2) r4 s8. \grace { e'8. c16 }
      <<
        \new Voice = "two"
        {
          \voiceOne
          s1
          \once \override Staff.Clef.break-visibility = #end-of-line-invisible
          \clef "treble_8"

          a8.-> a16~ %\tuplet 3/2 { a8 e( d } c4 e4 )
          a8[ e8( d8] c4( e4))

        }
        \new Voice = "one_more"
        {
          \voiceTwo
          a1( a,2) r4 s8. \grace { e'8. c16 }
          
        }
      >>     

      \clef "treble" \bar ":|]"
    }

    % \new Voice = "two"
    % {
    %  \voiceOne
    %   S1*11
    %   a'8.-> a16~ a8[ e8( d8] c4 e4)
    % }
    >>
  }

  \new Lyrics \lyricsto "one"
  {
    \lyricmode 
    {
        Hit the road, Jack 
        and don't you come back no more, no more, no more, no more. 
        Hit the road, Jack 
        and don't you come back no more
    }
  }
  \new Lyrics \lyricsto "one_more"
  {
    \lyricmode 
    {
        more 
        
    }
  }

  \new Lyrics \lyricsto "two"
  {
    \lyricmode 
    {
        What you say?!
    }
  }
>>
}

\layout {
    #(layout-set-staff-size 15)
    indent = #0
    %line-width = #150
    ragged-last = ##t
  }


\header {
    title = "Hit the road, Jack"
    subtitle = "Words & Music by Percy Mayfield"
    instrument = \markup \with-color #grey "Guitar"
    poet = ""
    piece = ""
    opus = ""
    %arranger = "Romanenko V.A."
    copyright = "CC BY-NC. 2018"
    tagline = ##f
}

\version "2.18.2"

