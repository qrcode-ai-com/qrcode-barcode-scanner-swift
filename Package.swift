// swift-tools-version:5.9
//
// QR Code & Barcode Scanner for Swift: read QR codes and barcodes from an image on iOS and macOS,
// in process, with the open-source engine compiled into the binary target below.
//
// Written by scripts/stage-swift-package.py of
// https://github.com/qrcode-ai-com/qrcode-barcode-scanner-rust from engine v0.11.0. The
// engine repository is the only hand-edited source: change it there, never here.

import PackageDescription

let package = Package(
    name: "QRCodeBarcodeScanner",
    platforms: [.iOS(.v13), .macOS(.v11)],
    products: [
        .library(name: "QRCodeBarcodeScanner", targets: ["QRCodeBarcodeScanner"]),
    ],
    targets: [
        // The Swift that UniFFI generates from the engine's library.
        .target(
            name: "QRCodeBarcodeScanner",
            dependencies: ["QrcodeAiScannerFFI"],
            path: "Sources/QRCodeBarcodeScanner"
        ),
        // The engine's static library for iOS devices, the iOS simulator and macOS.
        .binaryTarget(
            name: "QrcodeAiScannerFFI",
            url: "https://github.com/qrcode-ai-com/qrcode-barcode-scanner-rust/releases/download/swift-v0.11.0/QrcodeAiScannerFFI.xcframework.zip",
            checksum: "496d36d7e8ea8e9e414a1309b3f7af84bfce9009ca59265d3e90a8d00c89ad4b"
        ),
    ]
)
