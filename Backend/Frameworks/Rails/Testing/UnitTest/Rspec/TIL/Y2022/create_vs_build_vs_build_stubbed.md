### create

```html
FactoryBot.create(:profile) will create profile object and all association for it.
They will all be persisted in the database.
Also, it will trigger both model and database validations
```

### build

```html
On the other hand, FactoryBot.build(:profile) won't save the object, but will still
make requests to a database if the factory has associations.
It will trigger validations only for associated objects
```

### build_stubbed

```html
FactoryBot.build_stubbed(:profile) does not call database at all.
It creates and assigns attributes to an object to make it behave like an instantiated object.
It provides a fake id and created_at. Associations, if any, will be created via build_stubbed too.
It will not trigger any validations
```


```html
build(:user)           # → model (not saved)
create(:user)          # → model (saved)
attributes_for(:user)  # → hash
build_stubbed(:user)   # stubbed out attributes
```
