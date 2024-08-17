Reproing an issue with query determinism in chromadb. Run with

```
make install run
```

The db was created with roughly the following code. This demo only includes a small subset of the data used for convenience.

```python
client = chromadb.PersistentClient(path=db_path, settings=Settings(anonymized_telemetry=False))
collection = client.create_collection(name="collection", metadata={"hnsw:space": "cosine"})
df = pd.read_csv(precomputed_embeddings)
metadatas = df[[...]].to_dict("records"))
ids = df["id"].astype(str).tolist()
embeddings: List[Sequence[float]] = df["embeddings"].tolist()
collection.add(documents=None, metadatas=metadatas, ids=ids, embeddings=embeddings)  # pyright: ignore[reportUnknownMemberType]
```

