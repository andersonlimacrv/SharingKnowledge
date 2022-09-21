```tsx
function Example() {
	// undefined error
  // const [rows, setRows] = useState()

  // fix
  const [rows, setRows] = useState([])

  useEffect(() => {
    axios.get("http_request").then(function (response) {
      const data = response.data.data
      setRows(data)
    })
  }, [])

  return (
    <>
      <p>{console.log('check rows', rows)}</p>
    </>
  )
  // it return rows is undefined or empty
}
```


### answers
This is a common problem with async data.
The state is initially undefined, and is filled in later after the request has completed.
There will always be at least one render before your data is loaded.

### fix
You can fix this in several ways, but the simplest would be to just initialize the state to an empty array:

