"""
Dump Asset Editor previewer knobs.

Usage:
  1. Copy this file to:
     C:\\Program Files (x86)\\Steam\\steamapps\\common\\Sid Meier's Civilization VI SDK\\AssetModTools\\AssetEditor\\Scripts
  2. Open an asset in Asset Editor's previewer.
  3. Run the script from Asset Editor.

This is a diagnostic helper for investigating which preview controls are
available for CSC TileBase/building/district assets. It does not modify assets.
"""


def write(level, message):
    try:
        Outputs.WriteLine(level, message)
    except:
        print(message)


def info(message):
    write(OutputMessageType.Info, "[CSC knobs] " + message)


def warn(message):
    write(OutputMessageType.Warning, "[CSC knobs] " + message)


def get_preview_knobs():
    try:
        previewer_service = previewSetService._PreviewSetCommands__PreviewSetService
        entity_knob_set = previewer_service._PreviewerKnobService__EntityKnobSet
        return list(entity_knob_set.Knobs)
    except Exception as exc:
        warn("Could not access private previewer knob set: " + str(exc))
        return []


def describe_knob(knob):
    name = getattr(knob, "Name", None) or getattr(knob, "KnobName", "<unnamed>")
    value = "<unreadable>"
    values = None

    try:
        value = str(knob.Value)
    except:
        try:
            value = str(knob.KnobValue)
        except:
            pass

    try:
        values = list(knob.Values)
    except:
        values = None

    if values:
        preview_values = ", ".join([str(v) for v in values[:8]])
        if len(values) > 8:
            preview_values += ", ..."
        return "{} = {} | values: {}".format(name, value, preview_values)

    return "{} = {}".format(name, value)


try:
    data = previewSetService.GetPreviewSetData()
    info("Primary asset: {}".format(data.PrimaryAssetName))
    info("Primary asset type: {}".format(data.PrimaryAssetType))
    info("Opened asset count: {}".format(data.OpenedAssets.Count))
except Exception as exc:
    warn("Could not read preview set data: " + str(exc))

knobs = get_preview_knobs()
info("Knob count: {}".format(len(knobs)))

for knob in sorted(knobs, key=lambda k: getattr(k, "Name", "")):
    info(describe_knob(knob))
