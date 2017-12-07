. .\version.ps1

function Build {
param
(
    [string] $version,
    [string] $dockerfile = "Dockerfile",
	[string] $suffix = ""
)
	$latest = "latest${suffix}"
	$v = "${version}${suffix}"
	Write-Host "Building cortside/${image}:${v}"

	docker build --build-arg VERSION=${version} -t cortside/${image}:$latest -f $dockerfile .
	docker tag cortside/${image}:$latest cortside/${image}:${v}
}

Build -version $stable_version
Build -version $mainline_version
Build -version $nano_version -dockerfile "Dockerfile.nanoserver" -suffix "-nanoserver"
