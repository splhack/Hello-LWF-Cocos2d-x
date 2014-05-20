Hello-LWF-Cocos2d-x
===================

An example of LWF for C++ with Cocos2d-x renderer.

What is LWF?
------------

LWF http://gree.github.io/lwf/

> LWF is an animation engine which can play animation data converted from **FLASH contents** in HTML5, Unity, **Cocos2d-x**, iOS UIKit, and more. LWF is designed to make game development easy and fun.

It means that LWF allows you to make animation using Adobe Flash for your Cocos2d-x Application.

The example
-----------

You'll see a Flash movie which is embedded on Cocos2d-x.

![](http://gree.github.io/lwf-loader/images/lwfloader-sample3.png)

(This example animation is also available on HTML5 http://gree.github.io/lwf-demo/html5/lwf-loader/sample3.html)

How to use Adobe Flash for making animation
-------------------------------------------

Please take a look at [LWF Presentation](http://gree.github.io/lwf/presentation20121115) and [LWF Production Guide](http://gree.github.io/lwf-demo/pdf/FLASHforLWFproductionguideline.pdf).

Install LWFS https://github.com/gree/lwfs to convert Adobe Flash data into LWF data. It automatically converts in ~/Desktop/LWFS_work folder and shows the data on Web browser.

Notice
-------------------

This project does not use any texture atlas and batch node. It means that this project is not intended to show the rendering performance using LWF on Cocos2d-x.

How to use LWFNode with SpriteBatchNode
-------------------

    LWFNode *lwfNode = LWFNode::create("sample.lwf");
    SpriteBatchNode *batch = SpriteBatchNode::createWithTexture(lwfNode->getTexture());
    batch->addChild(lwfNode);
    this->addChild(batch);

sample.lwf should be converted with one texture atlas.
