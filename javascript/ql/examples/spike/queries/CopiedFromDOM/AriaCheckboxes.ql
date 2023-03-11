/**
 * @name ARIA checkboxes
 * @description If an element has the checkbox role but no checked state,
 *              AT behaviour may be undefined.
 * @kind problem
 * @problem.severity warning
 * @id js/aria-checkboxes
 * @precision low
 */

import javascript

predicate checkboxWithoutRequiredAttr() {
  exists(DOM::ElementDefinition elt, DOM::AttributeDefinition r|
    r = elt.getAttributeByName("role") and r.GetStringValue() = "checkbox"
  |
    not elt.GetAttributeByName("aria-checked")
  )
}

where checkboxWithoutRequiredAttr()
select elt,
  "Required ARIA attribute missing"