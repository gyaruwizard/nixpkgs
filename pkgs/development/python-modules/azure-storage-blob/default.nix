{ lib
, buildPythonPackage
, fetchPypi
, azure-common
, azure-core
, azure-storage-common
, msrest
, isPy3k
, futures ? null
}:

buildPythonPackage rec {
  pname = "azure-storage-blob";
  version = "12.14.1";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "sha256-hg1NgphaS/x9MnHnEnWvMw9U8zCnVDVUNae6dJzN6Zc=";
  };

  propagatedBuildInputs = [
    azure-common
    azure-core
    azure-storage-common
    msrest
  ] ++ lib.optional (!isPy3k) futures;

  # has no tests
  doCheck = false;

  meta = with lib; {
    description = "Client library for Microsoft Azure Storage services containing the blob service APIs";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = licenses.mit;
    maintainers = with maintainers; [ cmcdragonkai maxwilson ];
  };
}
