/**
 * @id js/examples/classname
 * @name Classes named 'AssessmentVisualizationEnabledToggle'
 * @description Finds classes named 'AssessmentVisualizationEnabledToggle'
 * @tags class
 *       name
 *       ECMAScript 6
 *       ECMAScript 2015
 */

import javascript

from ClassDefinition cd
where cd.getName() = "AssessmentVisualizationEnabledToggle"
select cd
