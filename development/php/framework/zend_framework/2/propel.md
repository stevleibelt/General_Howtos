# first idea, use zf2 classmap_generator

# by https://groups.google.com/forum/?fromgroups=#!topic/propel-users/lsHs-jjxp68
##generate classmap for propel
vim autoload_classmap.php
<?php
//generated by zf2 ./bin/classmap_generator.php
return array(
    'Propel' => __DIR__ . '/Propel/runtime/lib/Propel.php'
);
:wq

##generate classmap for your propel models by using zend classmap_generator
##map all directories generated by propel (map, om, you models) and run the class generator
cd path/to/your/propel/models
php path/to/vendor/zendframework/zendframework/bin/classmap_generator.php -w

##add it to the autoloader
vim module.php

public function getAutoloaderConfig()
{
    'Zend\Loader\ClassMapAutoloader' => (
        __DIR__ . '/path/to/propel/autoload_classmap.php'
    ),
    'Zend\Loader\StandardAutoloader' => array(
        'namespace' => array(
            __NAMESPACE__ => __DIR__ . '/src/' . __NAMESPACE__
        )
    )
    //extend if needed
}
:wq

##add propel init to a fitting place
##i prefere it in module.php::public function init()
\Propel::init('path/to/conf.php');
##you can use namespace in propel
###http://propelorm.org/reference/schema.html
###http://propelorm.org/cookbook/namespaces.html
vim schema.xml
<database ... namespace="/ClassNamespace/">
</database>
