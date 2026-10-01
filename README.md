# ScreenFX v1.0.0
Post processing effects library for GameMaker LTS 2026


# FAQ

## How do I get started using this?

1. Create a ScreenFX renderer in an object, preferably one that controls your camera or renders your screen.

```gml
renderer = new ScreenFXRenderer();
```

2. Add your desire effects and their settings. 
```gml
// i.e.
// Note: Passing in a constructor function as-is without new X() will do it for you.
renderer.AddEffectExt(
	new ScreenFXEffectPosterization(),
	new ScreenFXVignette(),
	new ScreenFXBloom(),
	new ScreenFXHueShift({
		shift: 128
	}),
);
```

3. Draw it!
```
// Post Draw Event
renderer.DrawApplicationSurface();
```

## Is this free?

Yes. It's completely free. Licensed under MIT. Feel free to do whatever you wish with that info. The only thing I ask is that you credit me.

## What effects are there?

There is frankly a lot to list, and I do not have the time or energy to do all of that. In the future I hope to get this onto a proper documentation page, but for now you can just check out the relevant `ScreenFXEffects*` scripts.

## Does this work across all platforms?

At the time of writing, not every single shader has been tested on every single platform.<br>
A majority of them have been checked to ensure that they at least work. In theory the amount of issues should be very low. But feel free to reach out if there is any problems.

## May I PR to this, whether it's a fix or adding a new shader?

Yes! Please see the [contribution](https://github.com/tabularelf/ScreenFX/blob/main/CONTRIBUTING.MD) document before proceeding!

## How can I get started learning shaders?

There is quite a fair amount of resources on how to make shaders, that do just expand beyond GameMaker! GameMaker however uses a very old version of OpenGL, prescisely 1.00 rev 17. So some resources may need some conversion.

Here is a list of recommended resources to check out.

DragoniteSpam: https://www.youtube.com/playlist?list=PL_hT--4HOvrdaXK-UhzilSYGCc66IuZUe

XorDev: https://gmshaders.com/

BookOfShaders: https://thebookofshaders.com/

GamingReverend: https://www.youtube.com/channel/UC7fkptPD1FHQyDc9Fnm9S_A

Unofficial OpenGL tutorials: https://www.opengl-tutorial.org/

LearnOpenGL: https://learnopengl.com/

## Is this the best library ever for post processing effects?

The best one is the one that works the best for you. Whether it is using one that already exists, or making your own system. This library is purely the best for me, because I need it for a game template that I can freely redistribute, and for making it easier to make custom post processing packs.

## Alternatives?

There isn't a whole lot of alternatives, but here is some I can recall from the top of my head.<br>
If I have missed any, please feel free to let me know!

[PPFX](https://foxyofjungle.itch.io/post-processing-fx)

[PostFX](https://github.com/sdelaughter/PostFX)
