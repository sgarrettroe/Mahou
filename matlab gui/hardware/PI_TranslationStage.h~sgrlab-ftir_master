
#define MAX_PARAMETER_NAME_SIZE (63)

typedef enum { INT, FLOAT, DOUBLE, STRING } ParameterType;

struct ParameterData {
    char Name[MAX_PARAMETER_NAME_SIZE+1];
    ParameterType Type;
    bool IsReadOnly;
    };

int __declspec(dllexport) Initialize();
int __declspec(dllexport) GetDeviceName(char *name);
int __declspec(dllexport) GetParameterCount();
int __declspec(dllexport) GetParameterData(char *name, int *type, int *is_read_only);
int __declspec(dllexport) GetParameter(const char *const parameterName, char *data);
int __declspec(dllexport) SetParameter(const char *const parameterName, const char *const data);
