~x = Buffer .read (s,"/Users/echohalt/Desktop/OKOK/aiff/SC_180123_000354.aiff");

~y = Buffer .read (s,"/Users/echohalt/Desktop/fllll.wav");

~x.play;

(
SynthDef(\help_PlayBuf, { arg out=0, bufnum=0;
    var trig;
    trig = Impulse.kr(MouseY.kr(500, 0.5, 10));
    Out.ar(out,
        PlayBuf.ar(2, bufnum, BufRateScale.kr(bufnum), trig, MouseX.kr(0, BufFrames.kr(bufnum)), 1)
    )
}).play(s, [\out, 0, \bufnum, ~x]);
)

~x.free;

s.record;
s.stopRecording;

SuperDirt.start

//mouseY(2_200); 0.3 0.5 200




a = Buffer .read (s,"/Users/echohalt/Desktop/partners/SC_180120_185614.aiff");

b = Buffer .read (s,"/Users/echohalt/Desktop/partners/SC_180120_185614.aiff");

(
SynthDef(\help_PlayBuf, {| out = 0, bufnum = 0 |
    Out.ar(out,
        PlayBuf.ar(2, bufnum, BufRateScale.kr(bufnum), loop: 1.0)
    )
}).play(s, [\out, 0, \bufnum, b]);
)


(
SynthDef.new(\playbuf_test, {
	    arg amp=1, out=0, buf, rate=1, t_trig=1, start=0, lopp=0,  da=2;
	    var sig;
	sig = PlayBuf.ar(2, buf, BufRateScale.kr(buf)*rate, t_trig, start, doneAction:da);
	    sig = sig*amp;
	Out.ar(out, sig);
}).add;
)

Synth.new (\playbuf_test, [\buf, a.bufnum, \rate, 12, \start, a.numFrames - 2]);
Synth.new (\playbuf_test, [\buf, b.bufnum, \rate, 20, \start, b.numFrames - 2]);


a.free;
b.free;

s.record;
s.stopRecording;


