\version "2.18.2"

\header {
  title = "Тигр"
  subtitle = "(Tiger Rag)"
  subsubtitle = "Н. Ла Рокка"
}

global = {
  \time 4/4
  \tempo 2 = 82
}

chordNames = \chordmode {
  \global
  \germanChords
  
  % 1 часть
  bes1 bes1 bes2 f2 bes1 bes1 bes1 bes2 f2 bes1
  c1:7  f1  c1:7  f1 c1:7  f1 c1:7  f1 
  
  % 2-я часть
  ees2 bes2:7 ees1 s1*2 
  ees2 bes2:7 ees1 bes1:7 s1 bes1:7 s1 ees1 s1 bes1:7 s1 ees1 s1 bes1:7 s1 ees1 s1
  aes2 ees2:7 aes2:6 b2:7 bes1:7 ees1 
  
  % 3-я часть
  aes1 s1*5 ees1:7 s1*7 aes1 s1 aes1 s1*3 aes1 s1
  des1 s1 d1:6 s1 aes1 f1:7 bes:7 ees:7 aes
}

melody = \relative c'' {
  \global
  \key bes \major
  
  
  %\segno
  \mark \markup { \musicglyph #"scripts.segno" }
  
  bes4 bes bes bes | bes8 bes4 f8 d4 f4 | bes8 d4 c8 (c8) f, g a | bes8 a bes c d2
  bes4 bes bes bes | bes8 bes4 f8 d4 f4 | bes8 d4 c8 (c8) f, g a | bes2. r4  
  
  %\coda
  \once \override Score.RehearsalMark.font-size = #5
  \mark \markup { \musicglyph #"scripts.coda" }
   % 2-я часть
  \bar "||" 

  c4 r r bes | a r r a | bes r r bes | a r r2 | c4 r r bes | a r r a | bes r r g | f r d'4. 
  \mark \markup { \musicglyph #"scripts.segno" }
  c8  
  
  \once \override Score.RehearsalMark.font-size = #5
  \mark \markup { \musicglyph #"scripts.coda" }
  \bar "||"
  \key ees \major
  
  ees,2. f4 | g8 bes4 g8 (g8) bes c d | ees4 r4 r8 bes c bes | ees4 d c bes | 
  ees,2. f4 | g8 bes4 g8 (g8) f8 ees4 | f r4 r8 bes, d f | bes4 aes f d |
  
  bes'8 d4 c8 (c2) | bes8 d4 c8 (c2) | bes8 ees4 c8 (c2) | bes8 ees4 c8 (c2)
   bes8 d4 c8 (c2) | bes8 d4 c8 (c2) | ees4 r r2 r1 |
   bes8 d4 c8 (c2) | bes8 d4 c8 (c2) | bes8 ees4 c8 (c2) | bes8 ees4 c8 (c2) \break
 
  c2 g | aes a | bes8 a bes c bes aes g f | ees2. r4
  
   % 3-я часть
  \bar "||"
  \key aes \major
  
  r4 aes'2  aes4 | aes2 c4 r4 | r4 aes2  aes4 | aes2 c4 r4 | r4 aes2  aes4 | aes2 c4 r4 |
  r4 g2 g4 | g2 bes4 r4 | r4 g2 g4 | g2 bes4 r4 | r4 g2 g4 | g2 bes4 r4 | r4 g2 g4 | g2 bes4 r4 |
  aes4 c, des d | ees8 ees e4 f g |
  r4 aes2  aes4 | aes2 c4 r4 | r4 aes2  aes4 | aes2 c4 r4 | 
  aes1(aes4) aes8 bes(bes) aes bes4 | aes1(aes2) r2 |
  
  r4 ces2 ces4 | ces2 aes4 r4 | r4 c2 c4 | c2 a4 r4 | 
  r4 c bes aes | bes c8 ees (ees) c bes4 | aes1 (aes4) r4 r2 \bar "|."
  
}

words = \lyricmode {
 
 \repeat unfold 127 { \skip 4 }
 Where's that ti -- ger! Where's that ti -- ger!
 Where's that ti -- ger! Where's that ti -- ger!
 Hold that ti -- ger! Hold that ti -- ger! Hold that ti -- ger!
 Choke him, poke him, kick him and soak him!
 Where's that ti -- ger! Where's that ti -- ger!
 Where __ oh where can he be? __
 Low or high -- brow, they all cry now -- \skip1
 %\markup { \italic "\"Please" play that Ti -- ger Rag for "me\"" }
 "\"Please," play that Ti -- ger Rag for "me\"" 
  
}

\score {
  <<
    \new ChordNames \chordNames
    %\new FretBoards \chordNames
    \new Staff { \melody }
    \addlyrics { \words }
  >>
  \layout { }
  \midi { }
}
