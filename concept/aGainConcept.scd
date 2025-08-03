(
~gain = 0.5;

b = Buffer.read(s, "/home/amsakan/dev/aClip/concept/huh.wav");

b.loadToFloatArray(action: { |array|
	for(0, array.size - 1, { |i|
		array[i] = array[i] * ~gain;
	});

	b.loadCollection(array);
});

x = {PlayBuf.ar(2, b, BufRateScale.kr(b), doneAction: 2)}.play;
)