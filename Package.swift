// swift-tools-version:5.9
//
// QR Code & Barcode Scanner for Swift: read QR codes and barcodes from an image on iOS and macOS,
// in process, with the open-source engine compiled into the binary target below.
//
// Written by scripts/stage-swift-package.py of
// https://github.com/qrcode-ai-com/qrcode-barcode-scanner-rust from engine v0.12.0. The
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
            url: "https://github.com/qrcode-ai-com/qrcode-barcode-scanner-rust/releases/download/swift-v0.12.0/QrcodeAiScannerFFI.xcframework.zip",
            checksum: "09cc53e7d538645e544ca2b617d6db519b72358e70d1a5111a70e0544bb14029"
        ),
    ]
)
