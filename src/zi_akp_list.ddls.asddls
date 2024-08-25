@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface View'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@UI.headerInfo: {
    typeName: 'Flight Connection',
    typeNamePlural: 'Flight Connections'
    }
@Search.searchable: true ---It display new field for search
define view entity ZI_AKP_LIST
  as select from /dmo/connection as connections
  association [1..*] to ZI_AKP_FLIGHT  as _flights on  $projection.CarrierId    = _flights.CarrierId
                                                   and $projection.ConnectionId = _flights.ConnectionId
  association [1]    to ZI_AKP_CARRIER as _carrier on  $projection.CarrierId = _carrier.CarrierId
{

      @UI.facet: [{
          id: 'Connection',
          purpose: #STANDARD,
          position: 10,
          importance: #HIGH,
          label: 'Connection  Details',
          type: #IDENTIFICATION_REFERENCE             --Object Page first facet
      },
      {
          id: 'Flight',
          purpose: #STANDARD,
          position: 20,
          importance: #HIGH,
          label: 'Flights',
          type: #LINEITEM_REFERENCE,                    --Object Page second facet
          targetElement: '_flights'
      }]
      @UI.lineItem: [{ position: 10  }]                 -- First Page Line item details sequence
      @UI.identification: [{ position: 10 }]            -- Object page Identifacation sequence
      @ObjectModel.text.association: '_carrier'         --To get both the id and text together
      @Search.defaultSearchElement: true                --Search applicable fields
  key carrier_id      as CarrierId,
      @UI.lineItem: [{ position: 20  }]
      @UI.identification: [{ position: 20 }]
  key connection_id   as ConnectionId,
      @UI.lineItem: [{ position: 30  }]
      @UI.selectionField: [{position: 10}]              --Selection field sequence in first page
      @UI.identification: [{ position: 30 }]
      @Search.defaultSearchElement: true                --Search applicable fields
      @Consumption.valueHelpDefinition: [{              -- Value help for airport ID
          entity: {
              name: 'ZI_AKP_AIRPORT_VH',
              element: 'AirportId'
          }
      }]
      airport_from_id as AirportFromId,
      @UI.lineItem: [{ position: 40  }]
      @UI.selectionField: [{position: 20}]
      @UI.identification: [{ position: 40 }]
      @Search.defaultSearchElement: true                --Search applicable fields
      @Consumption.valueHelpDefinition: [{              -- Value help for airport ID
          entity: {
              name: 'ZI_AKP_AIRPORT_VH',
              element: 'AirportId'
          }
      }]
      airport_to_id   as AirportToId,
      @UI.lineItem: [{ position: 50  }]
      @UI.identification: [{ position: 50 }]
      departure_time  as DepartureTime,
      @UI.lineItem: [{ position: 60  }]
      @UI.identification: [{ position: 60 }]
      arrival_time    as ArrivalTime,
      @UI.lineItem: [{ position: 70  }]
      @UI.identification: [{ position: 70 }]
      @Semantics.quantity.unitOfMeasure: 'DistanceUnit'
      distance        as Distance,
      distance_unit   as DistanceUnit,
      --Public Exposure
      _flights,
      @Search.defaultSearchElement: true --Search applicable fields - association
      _carrier
}
where
  carrier_id <> '';
