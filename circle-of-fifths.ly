\version "2.18.2"
%%
%% http://lsr.dsi.unimi.it/LSR/Item?id=1040
%% created by Manuela
%% thanks to the German forum http://www.lilypondforum.de
%% feel free to change and distribute
%%
%% draw a circle of fifths with Lilypond
%% in the style like here https://commons.wikimedia.org/wiki/File:Quintenzirkeldeluxe.png
%% you can use more Scheme if you like
%% e.g. drawing the ticker lines with whitening cirle as one graph
%% needs no include files

%% creating the score snippets
%% we remove some items not needed

\layout {
  indent = #0
  \context {
    \Staff
    \omit TimeSignature
    \omit BarLine
    explicitClefVisibility = #end-of-line-invisible
    explicitKeySignatureVisibility = #end-of-line-invisible
    \remove "Accidental_engraver"
  }
  \context {
    \Voice
    \omit NoteHead
    \omit Stem
  }
  \context {
    \Score
    \override BarNumber.break-visibility = #all-invisible
    \override KeyCancellation.break-visibility = #'#(#f #f #f)
  }
}

%% define score snippets as markups
%% in order of appearance

Cmaj=\markup \score { { \key c \major g'4 } \layout {  } }
Gmaj=\markup \score { { \key g \major g'4 } \layout {  } }
Dmaj=\markup \score { { \key d \major g'4 } \layout {  } }
Amaj=\markup \score { { \key a \major g'4 } \layout {  } }
Emaj=\markup \score { { \key e \major g'4 } \layout {  } }
Bmaj=\markup \score { { \key b \major g'4 } \layout {  } }
Fsmaj=\markup \score { { \key fis \major g'4 } \layout {  } }
Gfmaj=\markup \score { { \key ges \major g'4 } \layout {  } }
Dfmaj=\markup \score { { \key des \major g'4 } \layout {  } }
Afmaj=\markup \score { { \key as \major g'4 } \layout {  } }
Efmaj=\markup \score { { \key es \major g'4 } \layout {  } }
Bfmaj=\markup \score { { \key bes \major g'4 } \layout {  } }
Fmaj=\markup \score { { \key f \major g'4 } \layout {  } }

#(define (st-rot stencil myangle)
   ;; just for shortening the code
   (ly:stencil-rotate stencil myangle 0 0))

#(define (x-width mystencil)
   (let* ((x-ext (ly:stencil-extent mystencil X)))
     (- (cdr x-ext) (car x-ext))))

#(define (y-width mystencil)
   (let* ((y-ext (ly:stencil-extent mystencil Y)))
     (- (cdr y-ext) (car y-ext))))

#(define (angle->radian angle)
   (* ( / angle 180) PI))

#(define (circle-point radius angle)
   ;; this function returns the coordinates of a point on a circumference
   ;; as pair depending on radius and angle (in degrees)
   ;; like a clock: start at midnight ;-)
   ;; '(x . y)
   (let* ((radian (angle->radian angle)) ;; calculate angle as radian measure
           (x-sin (sin radian))
           (y-cos (cos radian))
           (x-cor (* x-sin radius))
           (y-cor (* y-cos radius)))
     (cons x-cor y-cor)))

#(define (return-center stencil)
   ;; returns the coordinates of the center of the stencil als pair
   ;; '(center-x . center-y)
   (let*
    ((x-left (car (ly:stencil-extent stencil X)))
     (x-right (cdr (ly:stencil-extent stencil X)))
     (y-left (car (ly:stencil-extent stencil Y)))
     (y-right (cdr (ly:stencil-extent stencil Y))))
    (cons (/ (+ x-left x-right) 2) (/ (+ y-left y-right) 2))))

#(define (move-to-circle radius angle stencil)
   ;; move a stencil to the edge of a circle
   ;; depending on radius and angle
   ;; the arithmetic middle of the stencil coordinates is the reference point
   ;; which is moved with its `center' to `circle-point'
   (let* ((center (return-center stencil))
          (center-x (car center))
          (center-y (cdr center))
          (circle-p (circle-point radius angle))
          (circle-p-x (car circle-p))
          (circle-p-y (cdr circle-p)))
     (ly:stencil-translate stencil
       (cons
        (- circle-p-x center-x)
        (- circle-p-y center-y)))))

#(define-markup-command (move-markup layout props mymrkp radius angle)
   (markup? number? number?)
   (move-to-circle radius angle (interpret-markup layout props mymrkp)))

#(define (move-to-circle-x radius angle stencil delta)
   ;; move stencil down (at six)
   ;; angle=0:  left aligned
   ;; angle<>0: right aligned
   ;; just for F#/Gb maj needed
   ;; two scales at six
   (let* ((center (return-center stencil))
          (center-x (car center))
          (center-y (cdr center))
          (circle-p (circle-point radius angle))
          (circle-p-x (car circle-p))
          (circle-p-y (cdr circle-p)))
     (if (= angle 0)
         (ly:stencil-translate stencil
           (cons
            (+ (* -2 center-x) delta)
            (* radius -1)))
         (ly:stencil-translate stencil
           (cons
            delta
            (* radius -1))))))

#(define-markup-command (move-markup-x layout props mymrkp radius angle delta)
   (markup? number? number? number?)
   (move-to-circle-x radius angle (interpret-markup layout props mymrkp) delta))

#(define-markup-command (move-and-scale layout props mymrkp factor x-offset)
   (markup? number? number?)
   (ly:stencil-translate
    (ly:stencil-scale
     (interpret-markup layout props mymrkp)
     factor factor)
    (cons x-offset 0))
   )

#(define c5-radius 30) %% inner radius of the cirle
#(define padding 1.45)  %% try what looks best
#(define ticker-len 1.07)
#(define outer-radius (* c5-radius padding)) %% outer radius
#(define maj-radius (* c5-radius 1.16))  %% try what looks best
#(define min-radius (/ c5-radius 1.3)) %% try what looks best

#(define ticker-line
   ;; this is the archetype of the ticker lines
   ;; that connect the majors with the minors
   ;; I combine six of them rotated at 30, 60, ... degrees
   (make-filled-box-stencil (cons -0.1 0.1)
     (cons (* -1 c5-radius ticker-len) (* c5-radius ticker-len))))

%%%% Remark
%% While 2.20.-update use markup-command \overlay instead of
%% multiple \combine
CircleOfFifths=
\markup {
  %% Score snippets
  \combine \move-markup \Gmaj #outer-radius #30
  \combine \move-markup \Dmaj #outer-radius #60
  \combine \move-markup \Amaj #outer-radius #90
  \combine \move-markup \Emaj #outer-radius #120
  \combine \move-markup \Bmaj #outer-radius #150
  \combine \move-markup-x \Fsmaj #outer-radius #180 #0.5
  \combine \move-markup-x \Gfmaj #outer-radius #0 #-0.5
  \combine \move-markup \Dfmaj #outer-radius #210
  \combine \move-markup \Afmaj #outer-radius #240
  \combine \move-markup \Efmaj #outer-radius #270
  \combine \move-markup \Bfmaj #outer-radius #300
  \combine \move-markup \Fmaj #outer-radius #330
  %% ticker lines
  \combine \stencil \ticker-line
  \combine \stencil #(st-rot ticker-line 30)
  \combine \stencil #(st-rot ticker-line 60)
  \combine \stencil #(st-rot ticker-line 90)
  \combine \stencil #(st-rot ticker-line 120)
  \combine \stencil #(st-rot ticker-line 150)
  %% whiten the interior of the circle
  \with-color #white
  \combine \draw-circle #(/ c5-radius ticker-len) #0 ##t
  %\draw-circle #c5-radius #0.5 ##f
  %% add major letters in blue
  \with-color #blue
  \abs-fontsize #22 \bold
  \combine \move-markup \circle "C" #maj-radius #0
  \combine \move-markup "G" #maj-radius #30
  \combine \move-markup "D" #maj-radius #60
  \combine \move-markup "A" #maj-radius #90
  \combine \move-markup "E" #maj-radius #120
  \combine \move-markup "B" #maj-radius #150
  \combine \move-markup "G♭/F♯" #maj-radius #180
  \combine \move-markup "D♭" #maj-radius #210
  \combine \move-markup "A♭" #maj-radius #240
  \combine \move-markup "E♭" #maj-radius #270
  \combine \move-markup "B♭" #maj-radius #300
  \combine \move-markup "F" #maj-radius #330
  %% add minor letters in red
  \with-color #red
  \combine \move-markup \circle "A" #min-radius #0
  \combine \move-markup "E" #min-radius #30
  \combine \move-markup "B" #min-radius #60
  \combine \move-markup "F♯" #min-radius #90
  \combine \move-markup "C♯" #min-radius #120
  \combine \move-markup "G♯" #min-radius #150
  \combine \move-markup "E♭/D♯" #min-radius #180
  \combine \move-markup "B♭" #min-radius #210
  \combine \move-markup "F" #min-radius #240
  \combine \move-markup "C" #min-radius #270
  \combine \move-markup "G" #min-radius #300
  \combine \move-markup "D" #min-radius #330
  \abs-fontsize #30
  \with-color #blue
  \combine \move-markup "Major" #outer-radius #0
  \with-color #red
  \combine \move-markup "Minor" #(* min-radius 0.6) #0
  \with-color #black
  \draw-circle #c5-radius #0.5 ##f

}
%% usage example
\markup \move-and-scale \CircleOfFifths #1 #50
