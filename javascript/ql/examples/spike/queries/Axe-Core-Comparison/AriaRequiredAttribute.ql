/*
 * @name Aria Required Attribute
 * @description Fail if a DOMElement omits an attribute required by the type
 */

 import javascript
 import Standards
 
 // Analog of aria-required-attr (debugged and working, but ignores focus consideration and closed comboboxes)
 from DOM::ElementDefinition e
   where exists(e.getAttributeByName("role"))
   and exists(Standards::DefinedRole role | (
     role.isSupportedRole(e.getAttributeByName("role")) = true
     and exists(string requiredAttribute | (
       requiredAttribute = role.getRequiredAttributes()
       and
       requiredAttribute != ""
       and
       not exists(e.getAttributeByName(requiredAttribute))
     ))
     ))
 select e, Standards::getElementAttributeValue(e, "role")
 