/**
 * @id js/examples/classname
 * @name Classes that directly extend React.Component
 * @description Finds classes directly extend React.Component
 * @tags class
 *       name
 *       ECMAScript 6
 *       ECMAScript 2015
 */

import javascript

from ClassDefinition cd
where cd.getSuperClass().getAChildExpr().toString() = "React.Component"
select cd
