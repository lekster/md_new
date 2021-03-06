<?php
/**
 * Go! OOP&AOP PHP framework
 *
 * @copyright     Copyright 2012, Lissachenko Alexander <lisachenko.it@gmail.com>
 * @license       http://www.opensource.org/licenses/mit-license.php The MIT License
 */

namespace Go\Core;

use Go\Aop\Aspect;

/**
 * Extension interface that defines an API for aspect loaders
 */
interface AspectLoaderExtension
{

    /**
     * Loader works with class-level definition of aspect
     */
    const TARGET_CLASS = 'class';

    /**
     * Loader works with method definitions of aspect
     */
    const TARGET_METHOD = 'method';

    /**
     * Loader works with property definitions of aspect
     */
    const TARGET_PROPERTY = 'property';

    /**
     * Loader works only with reflections of aspect class, method or property
     */
    const KIND_REFLECTION = 'reflection';

    /**
     * Loader works with each annotation defined for aspect class, method or property.
     */
    const KIND_ANNOTATION = 'annotation';

    /**
     * Return kind of loader, can be one of KIND_REFLECTION or KIND_ANNOTATION
     *
     * For loader that works with annotations additional metaInformation will be passed
     *
     * @return string
     */
    public function getKind();

    /**
     * Returns one or more target for loader, see TARGET_XXX constants
     *
     * @return string|array
     */
    public function getTarget();

    /**
     * Checks if loader is able to handle specific point of aspect
     *
     * @param Aspect $aspect Instance of aspect
     * @param mixed|\ReflectionClass|\ReflectionMethod|\ReflectionProperty $reflection Reflection of point
     * @param mixed|null $metaInformation Additional meta-information, e.g. annotation for method
     *
     * @return boolean true if extension is able to create an advisor from reflection and metaInformation
     */
    public function supports(Aspect $aspect, $reflection, $metaInformation = null);

    /**
     * Loads definition from specific point of aspect into the container
     *
     * @param AspectContainer $container Instance of container
     * @param Aspect $aspect Instance of aspect
     * @param mixed|\ReflectionClass|\ReflectionMethod|\ReflectionProperty $reflection Reflection of point
     * @param mixed|null $metaInformation Additional meta-information, e.g. annotation for method
     */
    public function load(AspectContainer $container, Aspect $aspect, $reflection, $metaInformation = null);
}
