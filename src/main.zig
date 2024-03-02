const std = @import("std");
const AllocationError = error{OutOfMemory};
const AccessDeniedError = error{AccessDenied};
const print = std.debug.print;
const fileError = error{
    AccessDenied,
    OutOfMemory,
    FileNotFound,
};
const File = std.fs.cwd;
const expect = std.testing.expect;

/// Comentario jeje xd
/// Este programa lee crea un archivo de texto, escribe "ola jeje comota" y lo muestra en consola
/// Tambien tiene un ejemplo de la recursividad en zig
pub fn main() !void {
    print("Valor de fibo: {d}", .{fibo(10)});
    //const err: fileError = AccessDeniedError.AccessDenied;
    var file = try File().createFile(
        "archivoxd.txt",
        .{ .read = true },
    ); //Asi se crea un archivo de texto en Zig
    defer file.close(); //Se tiene que cerrar el archivo en Zig, de esa forma no ocupara memoria incesaria
    const createFile = try file.writeAll("Ola jeje \n comota");
    _ = createFile; //Asi se llama a el metodo para que ejecute el archivo
    file = try File().openFile("archivoxd.txt", .{});
    var buf_reader = std.io.bufferedReader(file.reader());
    var in_stream = buf_reader.reader();
    var buf: [1024]u8 = undefined; //Tengo que declarar un buffer suficientemente grande para leer el archivo, para q sea eficaz
    while (try in_stream.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        print("Hola: {s} \n", .{line}); //Imprimir
    }
}

pub fn fibo(x: i32) i32 {
    if (x == 0) return 0 else if (x == 1) return 1 else return (fibo(x - 1) + fibo(x - 2));
}
