
# Copyright (c) 2014 The MITRE Corporation
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without modification, 
# are permitted provided that the following conditions are met:
# 
#     * Redistributions of source code must retain the above copyright notice, this 
#       list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright notice, 
#       this list of conditions and the following disclaimer in the documentation 
#       and/or other materials provided with the distribution.
#     * Neither the name of HL7 nor the names of its contributors may be used to 
#       endorse or promote products derived from this software without specific 
#       prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
# IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT 
# NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
# POSSIBILITY OF SUCH DAMAGE.
DT = require '../cql-datatypes'
CORE = require('./core')
Element = CORE.Element
Resource = CORE.Resource
Timing = CORE.Timing
Period = CORE.Period
Parameters = CORE.Parameters
Coding = CORE.Coding
Resource = CORE.Resource
Range = CORE.Range
Quantity = CORE.Quantity
Attachment = CORE.Attachment
BackboneElement = CORE.BackboneElement
DomainResource = CORE.DomainResource
ContactPoint = CORE.ContactPoint
ElementDefinition = CORE.ElementDefinition
Extension = CORE.Extension
HumanName = CORE.HumanName
Address = CORE.Address
Ratio = CORE.Ratio
SampledData = CORE.SampledData
Reference = CORE.Reference
CodeableConcept = CORE.CodeableConcept
Identifier = CORE.Identifier
Narrative = CORE.Narrative
Element = CORE.Element

###* 
Embedded class
@class ItemsComponent
@exports  ItemsComponent as ItemsComponent
###
class ItemsComponent extends BackboneElement
  constructor: (@json) ->
    super(@json)
  ###*
  A service line number.
  @returns {Array} an array of {@link Number} objects
  ###
  sequenceLinkId:-> @json['sequenceLinkId']
  
###*
This resource provides the request and line items details for the claim which is to be readjudicated.
@class Readjudicate
@exports Readjudicate as Readjudicate
###
class Readjudicate extends DomainResource
  constructor: (@json) ->
    super(@json)
  ###*
  The Response Business Identifier.
  @returns {Array} an array of {@link Identifier} objects
  ###
  identifier: ->
    if @json['identifier']
      for item in @json['identifier']
        new Identifier(item)
  
  ###*
  The version of the style of resource contents. This should be mapped to the allowable profiles for this and supporting resources.
  @returns {Coding}
  ###
  ruleset: -> if @json['ruleset'] then new Coding(@json['ruleset'])
  
  ###*
  The style (standard) and version of the original material which was converted into this resource.
  @returns {Coding}
  ###
  originalRuleset: -> if @json['originalRuleset'] then new Coding(@json['originalRuleset'])
  
  ###*
  The date when this resource was created.
  @returns {Array} an array of {@link Date} objects
  ###
  date:-> if @json['date'] then DT.DateTime.parse(@json['date'])
  
  ###*
  The Insurer who is target  of the request.
  @returns {Reference}
  ###
  target: -> if @json['target'] then new Reference(@json['target'])
  
  ###*
  The practitioner who is responsible for the services rendered to the patient.
  @returns {Reference}
  ###
  provider: -> if @json['provider'] then new Reference(@json['provider'])
  
  ###*
  The organization which is responsible for the services rendered to the patient.
  @returns {Reference}
  ###
  organization: -> if @json['organization'] then new Reference(@json['organization'])
  
  ###*
  Reference of resource to reverse.
  @returns {Reference}
  ###
  request: -> if @json['request'] then new Reference(@json['request'])
  
  ###*
  Reference of response to resource to reverse.
  @returns {Reference}
  ###
  response: -> if @json['response'] then new Reference(@json['response'])
  
  ###*
  A reference to supply which authenticated the process.
  @returns {Array} an array of {@link String} objects
  ###
  reference:-> @json['reference']
  
  ###*
  List of top level items to be readjudicated, if none specified then the entire submission is readjudicated.
  @returns {Array} an array of {@link ItemsComponent} objects
  ###
  item: ->
    if @json['item']
      for item in @json['item']
        new ItemsComponent(item)
  



module.exports.Readjudicate = Readjudicate
