<?php
/**
 * Go! OOP&AOP PHP framework
 *
 * @copyright     Copyright 2011, Lissachenko Alexander <lisachenko.it@gmail.com>
 * @license       http://www.opensource.org/licenses/mit-license.php The MIT License
 */

namespace Go\Aop\Intercept;

use Go\Aop\Advice;

/**
 * This interface represents a generic interceptor.
 *
 * <p>A generic interceptor can intercept runtime events that occur
 * within a base program. Those events are materialized by (reified
 * in) joinpoints. Runtime joinpoints can be invocations, field
 * access, exceptions...
 *
 * <p>This interface is not used directly. Use the the sub-interfaces
 * to intercept specific events. For instance, the following class
 * implements some specific interceptors in order to implement a
 * debugger:
 *
 * <pre class=code>
 * class DebuggingInterceptor implements MethodInterceptor,
 *     ConstructorInterceptor, FieldInterceptor {
 *
 *   public function invoke(MethodInvocation $i) {
 *       $this->debug($i->getMethod(), $i->getThis(), $i->getArgs());
 *       return $i->proceed();
 *   }
 *
 *   public function construct(ConstructorInvocation $i) {
 *       $this->debug($i->getConstructor(), $i->getThis(), $i->getArgs());
 *       return $i->proceed();
 *   }
 *
 *   public function get(FieldAccess $fa) {
 *       $this->debug($fa->getField(), $fa->getThis(), null);
 *       return $fa->proceed();
 *   }
 *
 *   public function set(FieldAccess $fa) {
 *       $this->debug($fa->getField(), $fa->getThis(), $fa->getValueToSet());
 *       return $fa->proceed();
 *   }
 *
 *   protected function debug($accessibleObject, $object, $value) {
 *       ...
 *   }
 * }
 * </pre>
 *
 * @see Joinpoint
 */
interface Interceptor extends Advice
{

}