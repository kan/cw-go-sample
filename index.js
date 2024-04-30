addEventListener('fetch', event => {
    event.respondWith(handleRequest(event.request));
});

async function handleRequest(request) {
    const wasm = await fetch("http://localhost:8080/main.wasm");
    const buf = await wasm.arrayBuffer();
    const { instance } = await WebAssembly.instantiate(buf);
    instance.exports.main();
    return new Response('Hello, World', { status: 200 });
}
