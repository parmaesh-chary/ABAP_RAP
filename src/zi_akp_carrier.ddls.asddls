@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Carrier Details'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@Search.searchable: true
define view entity ZI_AKP_CARRIER
  as select from /dmo/carrier
{
  key carrier_id    as CarrierId,
      @Semantics.text: true
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold:0.8
      name          as Name,
      currency_code as CurrencyCode
}
