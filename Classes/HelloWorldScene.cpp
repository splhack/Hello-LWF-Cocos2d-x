#include "HelloWorldScene.h"
#include "lwf_cocos2dx.h"

extern "C" {
#include "lua.h"
#include "lualib.h"
#include "lauxlib.h"
}

USING_NS_CC;

static int luaA_log(lua_State *L)
{
    int n = lua_gettop(L);
    for (int i = 1; i <= n; ++i) {
        if (lua_isstring(L, i)) {
            log("%s", lua_tostring(L, i));
        } else if (lua_isnil(L, i)) {
            log("nil");
        } else if (lua_isboolean(L, i)) {
            log(lua_toboolean(L, i) ? "true" : "false");
        } else {
            log("%s:%p", luaL_typename(L, i), lua_topointer(L, i));
        }
    }
    return 0;
}

Scene* HelloWorld::createScene()
{
    // 'scene' is an autorelease object
    auto scene = Scene::create();
    
    // 'layer' is an autorelease object
    auto layer = HelloWorld::create();

    // add layer as a child to scene
    scene->addChild(layer);

    // return the scene
    return scene;
}

// on "init" you need to initialize your instance
bool HelloWorld::init()
{
    //////////////////////////////
    // 1. super init first
    if ( !Layer::init() )
    {
        return false;
    }
    
    Size visibleSize = Director::getInstance()->getVisibleSize();
    Vec2 origin = Director::getInstance()->getVisibleOrigin();

    /////////////////////////////
    // 2. add a menu item with "X" image, which is clicked to quit the program
    //    you may modify it.

    // add a "close" icon to exit the progress. it's an autorelease object
    auto closeItem = MenuItemImage::create(
                                           "CloseNormal.png",
                                           "CloseSelected.png",
                                           CC_CALLBACK_1(HelloWorld::menuCloseCallback, this));
    
	closeItem->setPosition(Vec2(origin.x + visibleSize.width - closeItem->getContentSize().width/2 ,
                                origin.y + closeItem->getContentSize().height/2));

    // create menu, it's an autorelease object
    auto menu = Menu::create(closeItem, NULL);
    menu->setPosition(Vec2::ZERO);
    this->addChild(menu, 1);

    /////////////////////////////
    // 3. add your codes below...

    // add a label shows "Hello World"
    // create and initialize a label
    
    auto label = Label::createWithTTF("Hello World", "fonts/Marker Felt.ttf", 24);
    
    // position the label on the center of the screen
    label->setPosition(Vec2(origin.x + visibleSize.width/2,
                            origin.y + visibleSize.height - label->getContentSize().height));

    // add the label as a child to this layer
    this->addChild(label, 1);

    // add "HelloWorld" splash screen"
    auto sprite = Sprite::create("HelloWorld.png");

    // position the sprite on the center of the screen
    sprite->setPosition(Vec2(visibleSize.width/2 + origin.x, visibleSize.height/2 + origin.y));

    // add the sprite as a child to this layer
    this->addChild(sprite, 0);

    lua_State *L = luaL_newstate();
    luaopen_base(L);
    luaL_openlibs(L);
    lua_register(L, "log", luaA_log);

    static const char *table[] = {
        "attachLWF/attachLWF.lua",
        "cat/cat.lua",
    };
    for (size_t i = 0; i < sizeof(table) / sizeof(table[0]); ++i) {
        auto luaPath = table[i];
		auto data = FileUtils::getInstance()->getDataFromFile(luaPath);
        luaL_loadbuffer(L, (const char *)data.getBytes(), data.getSize(), luaPath);
        lua_pcall(L, 0, 0, 0);
    }

    // add a lwf
	const char *path = "attachLWF/attachLWF.lwf";
    auto lwfNode = LWFNode::create(path, L);
    lwfNode->setPosition(origin);
    lwfNode->lwf->FitForHeight(visibleSize.width, visibleSize.height);
    this->addChild(lwfNode);
    
    return true;
}


void HelloWorld::menuCloseCallback(Ref* pSender)
{
    Director::getInstance()->end();

#if (CC_TARGET_PLATFORM == CC_PLATFORM_IOS)
    exit(0);
#endif
}
