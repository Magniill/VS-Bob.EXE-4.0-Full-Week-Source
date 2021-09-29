package;

import flixel.FlxState;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import flixel.addons.transition.FlxTransitionableState;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;

#if windows
import Discord.DiscordClient;
#end

class SoundTestMenu extends MusicBeatState
{
	var woahmanstopspammin:Bool = true;

	var whiteshit:FlxSprite;

	var daValue:Int = 0;
	var pcmValue:Int = 0;

	var soundCooldown:Bool = true;

	var funnymonke:Bool = true;

	var incameo:Bool = false;

	var cameoBg:FlxSprite;
	var cameoImg:FlxSprite;
	var cameoThanks:FlxSprite;

	var pcmNO = new FlxText(FlxG.width / 6, FlxG.height / 2, 0, 'PCM  NO .', 23);
	var daNO = new FlxText(FlxG.width * .6, FlxG.height / 2, 0, 'DA  NO .', 23);

	var pcmNO_NUMBER = new FlxText(FlxG.width / 6, FlxG.height / 2, 0, '0', 23);
	var daNO_NUMBER = new FlxText(FlxG.width / 6, FlxG.height / 2, 0, '0', 23);
	

    override function create()
        {

			new FlxTimer().start(0.1, function(tmr:FlxTimer)
				{
					FlxG.sound.playMusic(Paths.music('breakfast'));
				});
		
			whiteshit = new FlxSprite().makeGraphic(1280, 720, FlxColor.WHITE);
			whiteshit.alpha = 0;

			cameoBg = new FlxSprite();
			cameoImg = new FlxSprite();
			cameoThanks = new FlxSprite();

			FlxG.sound.music.stop();

			var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.image('backgroundST'));
			bg.scrollFactor.x = 0;
			bg.scrollFactor.y = 0;
			bg.setGraphicSize(Std.int(bg.width * 1));
			bg.updateHitbox();
			bg.screenCenter();
			bg.antialiasing = true;
			add(bg);

			var soundtesttext = new FlxText(0, 0, 0, 'SOUND TEST THINGY', 25);
			soundtesttext.screenCenter();
			soundtesttext.y -= 180;
			soundtesttext.x -= 33;
			soundtesttext.setFormat("Sonic CD Menu Font Regular", 25, FlxColor.fromRGB(0, 163, 255));
			soundtesttext.setBorderStyle(SHADOW, FlxColor.BLACK, 4, 1);
			add(soundtesttext);
			


			pcmNO.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromRGB(174, 179, 251));
			pcmNO.setBorderStyle(SHADOW, FlxColor.fromRGB(106, 110, 159), 4, 1);

			daNO.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromRGB(174, 179, 251));
			daNO.setBorderStyle(SHADOW, FlxColor.fromRGB(106, 110, 159), 4, 1);



			
			pcmNO.y -= 70;
			pcmNO.x += 100;

			daNO.y -= 70;
			
			add(pcmNO);

			add(daNO);

			
			pcmNO_NUMBER.y -= 70;
			pcmNO_NUMBER.x += 270;
			pcmNO_NUMBER.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromRGB(174, 179, 251));
			pcmNO_NUMBER.setBorderStyle(SHADOW, FlxColor.fromRGB(106, 110, 159), 4, 1);
			add(pcmNO_NUMBER);

			
			daNO_NUMBER.y -= 70;
			daNO_NUMBER.x += daNO.x - 70;
			daNO_NUMBER.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromRGB(174, 179, 251));
			daNO_NUMBER.setBorderStyle(SHADOW, FlxColor.fromRGB(106, 110, 159), 4, 1);
			add(daNO_NUMBER);

			cameoBg.visible = false;
			add(cameoBg);

			cameoThanks.visible = false;
			add(cameoThanks);

			cameoImg.visible = false;
			add(cameoImg);



			add(whiteshit);

			
        }

	function changeNumber(selection:Int) 
	{
		if (funnymonke)
		{
			pcmValue += selection;
			if (pcmValue < 0) pcmValue = 69;
			if (pcmValue > 69) pcmValue = 0;
		}
		else
		{
			daValue += selection;
			if (daValue < 0) daValue = 37;
			if (daValue > 37) daValue = 0;
		}
	}

	function flashyWashy(a:Bool)
	{
		if (a == true)
		{
			FlxG.sound.play(Paths.sound('confirmMenu'));
			FlxTween.tween(whiteshit, {alpha: 1}, 0.4);
		}
		else
			FlxTween.color(whiteshit, 0.1, FlxColor.WHITE, FlxColor.BLUE);
			FlxTween.tween(whiteshit, {alpha: 0}, 0.2);

	}

	function doTheThing(first:Int, second:Int) 
	{
		if (first == 12 && second == 25)
		{
			woahmanstopspammin = false;
			PlayStateChangeables.nocheese = false;
			PlayState.SONG = Song.loadFromJson('endless-hard', 'endless');
			PlayState.isStoryMode = false;
			PlayState.storyDifficulty = 2;
			PlayState.storyWeek = 1;
			FlxTransitionableState.skipNextTransIn = true;
			FlxTransitionableState.skipNextTransOut = true;
			flashyWashy(true);
			new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				LoadingState.loadAndSwitchState(new PlayState());
			});
		}
		else if (first == 7 && second == 7)
			{
				woahmanstopspammin = false;
				PlayStateChangeables.nocheese = false;
				PlayState.SONG = Song.loadFromJson('execution-hard', 'execution');
				PlayState.isStoryMode = false;
				PlayState.storyDifficulty = 2;
				PlayState.storyWeek = 1;
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				flashyWashy(true);
				new FlxTimer().start(2, function(tmr:FlxTimer)
				{
					LoadingState.loadAndSwitchState(new PlayState());
				});
			}
		else if (first == 17 && second == 9)
			{
				woahmanstopspammin = false;
				PlayStateChangeables.nocheese = false;
				PlayState.SONG = Song.loadFromJson('little-man-hard', 'little-man');
				PlayState.isStoryMode = false;
				PlayState.storyDifficulty = 2;
				PlayState.storyWeek = 1;
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				flashyWashy(true);
				new FlxTimer().start(2, function(tmr:FlxTimer)
				{
					LoadingState.loadAndSwitchState(new PlayState());
				});
			}
		else if (first == 9 && second == 28)
			{
				woahmanstopspammin = false;
				PlayStateChangeables.nocheese = false;
				PlayState.SONG = Song.loadFromJson('sussus-toogus-hard', 'sussus-toogus');
				PlayState.isStoryMode = false;
				PlayState.storyDifficulty = 2;
				PlayState.storyWeek = 1;
				FlxTransitionableState.skipNextTransIn = true;
				FlxTransitionableState.skipNextTransOut = true;
				flashyWashy(true);
				new FlxTimer().start(2, function(tmr:FlxTimer)
				{
					LoadingState.loadAndSwitchState(new PlayState());
				});
			}
		else if (first == 3 && second == 1) 
		{
			woahmanstopspammin = false;
			flashyWashy(true);
			new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				cameoImg.visible = true;
				cameoImg.loadGraphic(Paths.image('cameostuff/Rightburst'));
				flashyWashy(false);
				FlxG.sound.music.stop();

			});
			new FlxTimer().start(2.1, function(tmr:FlxTimer)
			{
				FlxG.sound.playMusic(Paths.music('cameostuff/Rightburst'));	
				incameo = true;
			});
		}
		else if (first == 12 && second == 11)
		{
			woahmanstopspammin = false;
			flashyWashy(true);
			new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				cameoBg.visible = true;
				cameoBg.frames = Paths.getSparrowAtlas('cameostuff/VaniaBG');
				FlxG.log.add(cameoBg.visible); 
				cameoBg.animation.addByPrefix('wave', 'VaniaBG', 24, true);				
				cameoImg.visible = true;
				cameoBg.x -= 200;
				cameoBg.y -= 100;
				cameoImg.loadGraphic(Paths.image('cameostuff/Vania'));
				cameoImg.x += 270;
				cameoImg.y -= 50;
				flashyWashy(false);
				FlxG.sound.music.stop();
			});
			new FlxTimer().start(2.1, function(tmr:FlxTimer)
			{
				cameoBg.animation.play('wave');
				FlxG.sound.playMusic(Paths.music('cameostuff/Vania'));	
				incameo = true;
			});
		}
		else if (first == 41 && second == 1) 
		{
			woahmanstopspammin = false;
			flashyWashy(true);
			new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				cameoImg.visible = true;
				cameoImg.loadGraphic(Paths.image('cameostuff/Razencro'));
				cameoImg.setSize(1280, 720);
				flashyWashy(false);
				FlxG.sound.music.stop();

			});
			new FlxTimer().start(2.1, function(tmr:FlxTimer)
			{
				FlxG.sound.playMusic(Paths.music('cameostuff/Razencro'));	
				incameo = true;
			});
		}
		else if (first == 69 && second == 27) 
		{
			woahmanstopspammin = false;
			flashyWashy(true);
			new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				cameoImg.visible = true;
				cameoImg.loadGraphic(Paths.image('cameostuff/Zekuta'));
				cameoImg.setSize(1280, 720);
				flashyWashy(false);
				FlxG.sound.music.stop();

			});
			new FlxTimer().start(2.1, function(tmr:FlxTimer)
			{
				FlxG.sound.playMusic(Paths.music('cameostuff/Zekuta'));	
				incameo = true;
			});
		}
		else if (first == 6 && second == 9) 
			{
				woahmanstopspammin = false;
				flashyWashy(true);
				new FlxTimer().start(2, function(tmr:FlxTimer)
				{
					cameoImg.visible = true;
					cameoBg.visible = true;
					cameoThanks.visible = true;
					cameoThanks.loadGraphic(Paths.image('cameostuff/thanks'));
					cameoThanks.setSize(1280, 720);
					cameoImg.frames = Paths.getSparrowAtlas('cameostuff/Comgaming');
					cameoImg.animation.addByPrefix('bounce', 'Comgaming instance 1', 20, true);	
					cameoBg.frames = Paths.getSparrowAtlas('cameostuff/BGCOMLOL');
					cameoBg.animation.addByPrefix('move', 'BGCOM', 19, true);
					cameoImg.y += 5;
					cameoImg.setSize(1280, 720);
					cameoBg.setSize(1280, 720);
					flashyWashy(false);
					FlxG.sound.music.stop();
	
				});
				new FlxTimer().start(2.1, function(tmr:FlxTimer)
				{
					cameoImg.animation.play('bounce');
					cameoBg.animation.play('move');

					FlxG.sound.playMusic(Paths.music('cameostuff/Comgaming'));	
					incameo = true;
				});
			}
		else if (first == 11 && second == 9) 
		{
			woahmanstopspammin = false;
			flashyWashy(true);
			new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				cameoImg.visible = true;
				cameoImg.loadGraphic(Paths.image('cameostuff/Crybit'));
				cameoImg.setSize(1280, 720);
				flashyWashy(false);
				FlxG.sound.music.stop();

			});
			new FlxTimer().start(2.1, function(tmr:FlxTimer)
			{
				FlxG.sound.playMusic(Paths.music('cameostuff/Crybit'));	
				incameo = true;
			});
		}
		else if (first == 32 && second == 8) 
		{
			woahmanstopspammin = false;
			flashyWashy(true);
			new FlxTimer().start(2, function(tmr:FlxTimer)
			{
				cameoImg.visible = true;
				cameoImg.loadGraphic(Paths.image('cameostuff/Marstarbro'));
				cameoImg.setSize(1280, 720);
				flashyWashy(false);
				FlxG.sound.music.stop();

			});
			new FlxTimer().start(2.1, function(tmr:FlxTimer)
			{
				FlxG.sound.playMusic(Paths.music('cameostuff/Marstarbro'));	
				incameo = true;
			});
		}
		else
		{
			if (soundCooldown)
			{
				soundCooldown = false;
				FlxG.sound.play(Paths.sound('deniedMOMENT'));
				new FlxTimer().start(0.8, function(tmr:FlxTimer)
				{
					soundCooldown = true;
				});
			}
        }
	}
		
	override public function update(elapsed:Float)
		{
			if (FlxG.keys.justPressed.RIGHT || FlxG.keys.justPressed.LEFT || FlxG.keys.justPressed.A || FlxG.keys.justPressed.D) if (woahmanstopspammin) funnymonke = !funnymonke;

			if (FlxG.keys.justPressed.DOWN || FlxG.keys.justPressed.S) if (woahmanstopspammin) changeNumber(1);

			if (FlxG.keys.justPressed.UP || FlxG.keys.justPressed.W) if (woahmanstopspammin) changeNumber(-1);

			if (FlxG.keys.justPressed.ENTER && woahmanstopspammin) doTheThing(pcmValue, daValue);

			if (FlxG.keys.justPressed.ENTER && !woahmanstopspammin && incameo) LoadingState.loadAndSwitchState(new SoundTestMenu());

			if (FlxG.keys.justPressed.ESCAPE && woahmanstopspammin && !incameo) LoadingState.loadAndSwitchState(new MainMenuState());

			if (funnymonke)
			{
				pcmNO.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromRGB(254, 174, 0));
				pcmNO.setBorderStyle(SHADOW, FlxColor.fromRGB(253, 36, 3), 4, 1);
		
				daNO.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromRGB(174, 179, 251));
				daNO.setBorderStyle(SHADOW, FlxColor.fromRGB(106, 110, 159), 4, 1);
			}
			else
			{
				pcmNO.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromRGB(174, 179, 251));
				pcmNO.setBorderStyle(SHADOW, FlxColor.fromRGB(106, 110, 159), 4, 1);
	
				daNO.setFormat("Sonic CD Menu Font Regular", 23, FlxColor.fromRGB(254, 174, 0));
				daNO.setBorderStyle(SHADOW, FlxColor.fromRGB(253, 36, 3), 4, 1);
			}
			
			if (pcmValue < 10)	pcmNO_NUMBER.text = '0' + Std.string(pcmValue);
			else pcmNO_NUMBER.text = Std.string(pcmValue);

			if (daValue < 10)	daNO_NUMBER.text = '0' + Std.string(daValue);
			else daNO_NUMBER.text = Std.string(daValue);

					

					




			super.update(elapsed);
		}
	

}