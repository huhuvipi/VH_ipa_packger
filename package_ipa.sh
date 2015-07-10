IPA="$1"
TEMP_IPA_BUILT="/tmp/ipabuild"
DEVELOPER_DIR=`xcode-select --print-path`
APP="${TEMP_IPA_BUILT}/Payload/*.app"
if [ ! -d "${DEVELOPER_DIR}" ]; then
    echo "No developer directory found!"
    exit 1
fi
#reparing for temp directory
if [ -d "${TEMP_IPA_BUILT}" ];
then
    rm -rf "${TEMP_IPA_BUILT}"
fi  

mkdir ${TEMP_IPA_BUILT}
echo "unzip the ipa"
unzip -q "${IPA}.ipa" -d "${TEMP_IPA_BUILT}"

echo "+ Adding SWIFT support (if necessary)"
mkdir -p "${TEMP_IPA_BUILT}/SwiftSupport"

for SWIFT_LIB in $(ls -1 ${APP}/Frameworks); do 
    echo "Copying ${SWIFT_LIB}"
    cp "${DEVELOPER_DIR}/Toolchains/XcodeDefault.xctoolchain/usr/lib/swift/iphoneos/${SWIFT_LIB}" "${TEMP_IPA_BUILT}/SwiftSupport"
done

rm -rf "${IPA}"

echo "+ zip --symlinks --verbose --recurse-paths ${IPA} ."
cd "${TEMP_IPA_BUILT}"
zip --symlinks --verbose --recurse-paths "${IPA}.ipa" .
echo "===ADDING SWIFT_LIB SUCCESS===" 