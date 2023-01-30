# Product

[Synion product documentation.](https://documentatie.synion.nl/products/)

## CI&CD

### Integration

Voor het bijwerken van test executie resultaten naar Azure is er een service principal nodig die door [de test pipeline](https://github.com/synionnl/common-library/blob/main/.github/workflows/test.yml) en de [living documenation pipeline](https://github.com/synionnl/synionnl.github.io/blob/main/.github/workflows/md-docs.yml) gebruikt wordt.

```
az ad sp create-for-rbac \
  --name md-docs-actions-azure-synion \
  --role Contributor \
  --scope "/subscriptions/f041be18-2519-415a-8141-cadf8856161e/resourceGroups/synion/providers/Microsoft.Storage/storageAccounts/synionstorage/containersList/default/containers/test-executions" \
  --sdk-auth
```

Het resultaat moet als secret worden toegevoegd met de naam **AZURE_CREDENTIALS** op de volgende locatie: https://github.com/organizations/synionnl/settings/secrets/actions
