# DefenderShell v1.0
# Script de PowerShell para tareas de Windows Defender

function Mostrar-Menu {
    Clear-Host
    Write-Host "          ╔╦╗┌─┐┌─┐┌─┐┌┐┌┌┬┐┌─┐┬─┐╔═╗┬ ┬┌─┐┬  ┬              "
    Write-Host "           ║║├┤ ├┤ ├┤ │││ ││├┤ ├┬┘╚═╗├─┤├┤ │  │              "
    Write-Host "========= ═╩╝└─┘└  └─┘┘└┘─┴┘└─┘┴└─╚═╝┴ ┴└─┘┴─┘┴─┘v1.0 ======="
    Write-Host "1. Actualizar Firmas de Windows Defender                     " -BackgroundColor Magenta
    Write-Host "2. Ejecutar Escaneo Rápido                                   " -BackgroundColor Magenta
    Write-Host "3. Ejecutar Escaneo Completo                                 " -BackgroundColor Magenta
    Write-Host "0. Salir                                                     " -BackgroundColor Magenta
    Write-Host "===================================== Power by MrGuillote ==="
    Write-Host ""
}

function Actualizar-Firmas {
    Write-Host "Actualizando Firmas de Windows Defender..."
    Update-MpSignature
    Write-Host "Actualización de Firmas completa."
}

function Ejecutar-EscaneoRapido {
    Write-Host "Ejecutando Escaneo Rápido..."
    Start-MpScan -ScanType QuickScan
    Write-Host "Escaneo Rápido completo."
}

function Ejecutar-EscaneoCompleto {
    Write-Host "Ejecutando Escaneo Completo..."
    Start-MpScan -ScanType FullScan
    Write-Host "Escaneo Completo completo."
}

do {
    Mostrar-Menu
    $opcion = Read-Host "Selecciona una opción (0-3): "

    switch ($opcion) {
        "1" { Actualizar-Firmas }
        "2" { Ejecutar-EscaneoRapido }
        "3" { Ejecutar-EscaneoCompleto }
        "0" { break }
        default { Write-Host "Opción inválida. Por favor, intenta nuevamente." }
    }

    # Esperar entrada del usuario para continuar
    Write-Host "Presiona Enter para continuar o '0' para salir..."
    $opcionUsuario = Read-Host
    if ($opcionUsuario -eq "0") {
        break
    }
} while ($true)
