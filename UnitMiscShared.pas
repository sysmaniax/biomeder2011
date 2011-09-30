unit UnitMiscShared;

interface

var iQueryType: integer;

const
  QUERY_TYPE_PRODUCTS_TABLE = 0;
  QUERY_TYPE_CUSTOMERS_TABLE = 1;
  QUERY_TYPE_INVOICES_TABLE = 2;

  TABLE_NAME_PRODUCTS = 'Prodotti';
  TABLE_NAME_CUSTOMERS = 'Indirizzario';
  TABLE_NAME_INVOICES = 'Fatture';

// String constants;
  STR_MSG_SAVE_MODIFIED_RECORDS = 'Salvare le modifiche apportate ai dati?';
  STR_MSG_CHANGES_SAVED = 'Modifiche salvate correttamente.';

implementation

end.
 