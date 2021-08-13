# Python Function that takes input as a nested object & a key , return back the value as a output


def find_by_key(obj, key):
    key_list = key.split('/')
    if isinstance(obj, dict):
        for k, v in obj.items():
            if k == key_list[-1]:
                yield v

            else:
                yield from find_by_key(v, key)

    elif isinstance(obj, list):
        for sub in obj:
            yield from find_by_key(sub, key)

    else:
        return
